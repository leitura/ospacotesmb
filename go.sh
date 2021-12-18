#!/bin/bash

# This file is accessible as https://multi.netlify.app/go.sh

# If not specify, default meaning of return value:
# 0: Success
# 1: System error
# 2: Application error
# 3: Network error

# CLI arguments
PROXY=''
HELP=''
FORCE=''
CHECK=''
REMOVE=''
VERSION=''
VSRC_ROOT='/tmp/v2ray'
EXTRACT_ONLY=''
LOCAL=''
LOCAL_INSTALL=''
ERROR_IF_UPTODATE=''

CUR_VER=""
NEW_VER=""
ZIPFILE="/tmp/v2ray/v2ray.zip"
V2RAY_RUNNING=0

CMD_INSTALL=""
CMD_UPDATE=""
SOFTWARE_UPDATED=0
KEY="V2Ray"
KEY_LOWER="v2ray"
REPOS="v2fly/v2ray-core"

SYSTEMCTL_CMD=$(command -v systemctl 2>/dev/null)

#######color code########
RED="31m"      # Error message
GREEN="32m"    # Success message
YELLOW="33m"   # Warning message
BLUE="36m"     # Info message

xray_set(){
    KEY="Xray"
    KEY_LOWER="xray"
    REPOS="XTLS/Xray-core"
    VSRC_ROOT='/tmp/xray'
    ZIPFILE="/tmp/xray/xray.zip"
}

#########################
while [[ $# > 0 ]]; do
    case "$1" in
        -p|--proxy)
        PROXY="-x ${2}"
        shift # past argument
        ;;
        -h|--help)
        HELP="1"
        ;;
        -f|--force)
        FORCE="1"
        ;;
        -c|--check)
        CHECK="1"
        ;;
        -x|--xray)
        xray_set
        ;;
        --remove)
        REMOVE="1"
        ;;
        --version)
        VERSION="$2"
        shift
        ;;
        --extract)
        VSRC_ROOT="$2"
        shift
        ;;
        --extractonly)
        EXTRACT_ONLY="1"
        ;;
        -l|--local)
        LOCAL="$2"
        LOCAL_INSTALL="1"
        shift
        ;;
        --errifuptodate)
        ERROR_IF_UPTODATE="1"
        ;;
        *)
                # unknown option
        ;;
    esac
    shift # past argument or value
done

###############################
colorEcho(){
    echo -e "\033[${1}${@:2}\033[0m" 1>& 2
}

archAffix(){
    case "$(uname -m)" in
      'i386' | 'i686')
        MACHINE='32'
        ;;
      'amd64' | 'x86_64')
        MACHINE='64'
        ;;
      'armv5tel')
        MACHINE='arm32-v5'
        ;;
      'armv6l')
        MACHINE='arm32-v6'
        grep Features /proc/cpuinfo | grep -qw 'vfp' || MACHINE='arm32-v5'
        ;;
      'armv7' | 'armv7l')
        MACHINE='arm32-v7a'
        grep Features /proc/cpuinfo | grep -qw 'vfp' || MACHINE='arm32-v5'
        ;;
      'armv8' | 'aarch64')
        MACHINE='arm64-v8a'
        ;;
      'mips')
        MACHINE='mips32'
        ;;
      'mipsle')
        MACHINE='mips32le'
        ;;
      'mips64')
        MACHINE='mips64'
        ;;
      'mips64le')
        MACHINE='mips64le'
        ;;
      'ppc64')
        MACHINE='ppc64'
        ;;
      'ppc64le')
        MACHINE='ppc64le'
        ;;
      'riscv64')
        MACHINE='riscv64'
        ;;
      's390x')
        MACHINE='s390x'
        ;;
        *)
        echo "erro: a arquitetura não é compatível. "
        exit 1
        ;;
    esac

	return 0
}

zipRoot() {
    unzip -lqq "$1" | awk -e '
        NR == 1 {
            prefix = $4;
        }
        NR != 1 {
            prefix_len = length(prefix);
            cur_len = length($4);

            for (len = prefix_len < cur_len ? prefix_len : cur_len; len >= 1; len -= 1) {
                sub_prefix = substr(prefix, 1, len);
                sub_cur = substr($4, 1, len);

                if (sub_prefix == sub_cur) {
                    prefix = sub_prefix;
                    break;
                }
            }

            if (len == 0) {
                prefix = "";
                nextfile;
            }
        }
        END {
            print prefix;
        }
    '
}

downloadV2Ray(){
    rm -rf /tmp/$KEY_LOWER
    mkdir -p /tmp/$KEY_LOWER
    local PACK_NAME=$KEY_LOWER
    [[ $KEY == "Xray" ]] && PACK_NAME=$KEY
    DOWNLOAD_LINK="https://github.com/$REPOS/releases/download/${NEW_VER}/${PACK_NAME}-linux-${MACHINE}.zip"
    colorEcho ${BLUE} "Baixando $KEY: ${DOWNLOAD_LINK}"
    curl ${PROXY} -L -H "Cache-Control: no-cache" -o ${ZIPFILE} ${DOWNLOAD_LINK}
    if [ $? != 0 ];then
        colorEcho ${RED} "Falhou o download! Verifique sua rede ou tente novamente. "
        return 3
    fi
    return 0
}

installSoftware(){
    COMPONENT=$1
    if [[ -n `command -v $COMPONENT` ]]; then
        return 0
    fi

    getPMT
    if [[ $? -eq 1 ]]; then
        colorEcho ${RED} "A ferramenta de gerenciamento de pacotes do sistema não é APT ou YUM, instale ${COMPONENT} manualmente."
        return 1
    fi
    if [[ $SOFTWARE_UPDATED -eq 0 ]]; then
        colorEcho ${BLUE} "Atualizando repositório de software "
        $CMD_UPDATE
        SOFTWARE_UPDATED=1
    fi

    colorEcho ${BLUE} "Instalando ${COMPONENT}"
    $CMD_INSTALL $COMPONENT
    if [[ $? -ne 0 ]]; then
        colorEcho ${RED} "Falha na instalação ${COMPONENT}. Por favor, instale manualmente."
        return 1
    fi
    return 0
}

# return 1: not apt, yum, or zypper
getPMT(){
    if [[ -n `command -v apt-get` ]];then
        CMD_INSTALL="apt-get -y -qq install"
        CMD_UPDATE="apt-get -qq update"
    elif [[ -n `command -v yum` ]]; then
        CMD_INSTALL="yum -y -q install"
        CMD_UPDATE="yum -q makecache"
    elif [[ -n `command -v zypper` ]]; then
        CMD_INSTALL="zypper -y install"
        CMD_UPDATE="zypper ref"
    else
        return 1
    fi
    return 0
}

normalizeVersion() {
    if [ -n "$1" ]; then
        case "$1" in
            v*)
                echo "$1"
            ;;
            *)
                echo "v$1"
            ;;
        esac
    else
        echo ""
    fi
}

# 1: new V2Ray. 0: no. 2: not installed. 3: check failed. 4: don't check.
getVersion(){
    if [[ -n "$VERSION" ]]; then
        NEW_VER="$(normalizeVersion "$VERSION")"
        return 4
    else
        VER="$(/usr/bin/$KEY_LOWER/$KEY_LOWER -version 2>/dev/null)"
        RETVAL=$?
        CUR_VER="$(normalizeVersion "$(echo "$VER" | head -n 1 | cut -d " " -f2)")"
        TAG_URL="https://api.github.com/repos/$REPOS/releases/latest"
        NEW_VER="$(normalizeVersion "$(curl ${PROXY} -H "Accept: application/json" -H "User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:74.0) Gecko/20100101 Firefox/74.0" -s "${TAG_URL}" --connect-timeout 10| grep 'tag_name' | cut -d\" -f4)")"

        if [[ $? -ne 0 ]] || [[ $NEW_VER == "" ]]; then
            colorEcho ${RED} "Falha ao buscar informações de lançamento. Verifique sua rede ou tente novamente."
            return 3
        elif [[ $RETVAL -ne 0 ]];then
            return 2
        elif [[ $NEW_VER != $CUR_VER ]];then
            return 1
        fi
        return 0
    fi
}

stopV2ray(){
    colorEcho ${BLUE} "Desligando $KEY serviço."
    if [[ -n "${SYSTEMCTL_CMD}" ]] || [[ -f "/lib/systemd/system/$KEY_LOWER.service" ]] || [[ -f "/etc/systemd/system/$KEY_LOWER.service" ]]; then
        ${SYSTEMCTL_CMD} stop $KEY_LOWER
    fi
    if [[ $? -ne 0 ]]; then
        colorEcho ${YELLOW} "Falha ao desligar $KEY serviço."
        return 2
    fi
    return 0
}

startV2ray(){
    if [ -n "${SYSTEMCTL_CMD}" ] && [[ -f "/lib/systemd/system/$KEY_LOWER.service" || -f "/etc/systemd/system/$KEY_LOWER.service" ]]; then
        ${SYSTEMCTL_CMD} start $KEY_LOWER
    fi
    if [[ $? -ne 0 ]]; then
        colorEcho ${YELLOW} "Falha ao iniciar $KEY serviço."
        return 2
    fi
    return 0
}

installV2Ray(){
    # Install $KEY binary to /usr/bin/$KEY_LOWER
    mkdir -p /etc/$KEY_LOWER /var/log/$KEY_LOWER && \
    if [[ $KEY == "Xray" ]];then
        unzip -oj "$1" "$2xray" "$2geoip.dat" "$2geosite.dat" -d /usr/bin/$KEY_LOWER && \
        chmod +x /usr/bin/$KEY_LOWER/$KEY_LOWER || {
            colorEcho ${RED} "Falha ao copiar $KEY binários e recursos."
            return 1
        }
    else
        unzip -oj "$1" "$2v2ray" "$2v2ctl" "$2geoip.dat" "$2geosite.dat" -d /usr/bin/$KEY_LOWER && \
        chmod +x /usr/bin/$KEY_LOWER/$KEY_LOWER /usr/bin/$KEY_LOWER/v2ctl || {
            colorEcho ${RED} "Falha ao copiar $KEY binários e recursos."
            return 1
        }
    fi

    # Install V2Ray server config to /etc/v2ray
    if [ ! -f /etc/$KEY_LOWER/config.json ]; then
        local PORT="$(($RANDOM + 10000))"
        local UUID="$(cat '/proc/sys/kernel/random/uuid')"

        if [[ $KEY == "Xray" ]];then
            cat > /etc/$KEY_LOWER/config.json <<EOF
{
  "inbounds": [{
    "port": 10086,
    "protocol": "vmess",
    "settings": {
      "clients": [
        {
          "id": "23ad6b10-8d1a-40f7-8ad0-e3e35cd38297",
          "level": 1,
          "alterId": 64
        }
      ]
    }
  }],
  "outbounds": [{
    "protocol": "freedom",
    "settings": {}
  },{
    "protocol": "blackhole",
    "settings": {},
    "tag": "blocked"
  }],
  "routing": {
    "rules": [
      {
        "type": "field",
        "ip": ["geoip:private"],
        "outboundTag": "blocked"
      }
    ]
  }
}
EOF
            sed -i "s/10086/${PORT}/g; s/23ad6b10-8d1a-40f7-8ad0-e3e35cd38297/${UUID}/g;" /etc/$KEY_LOWER/config.json
        else
            unzip -pq "$1" "$2vpoint_vmess_freedom.json" | \
            sed -e "s/10086/${PORT}/g; s/23ad6b10-8d1a-40f7-8ad0-e3e35cd38297/${UUID}/g;" - > \
            /etc/$KEY_LOWER/config.json || {
                colorEcho ${YELLOW} "Falha ao criar $KEY arquivo de configuração. Crie-o manualmente."
                return 1
            }
        fi

        colorEcho ${BLUE} "PORT:${PORT}"
        colorEcho ${BLUE} "UUID:${UUID}"
    fi
}


installInitScript(){
    if [[ ! -f "/etc/systemd/system/$KEY_LOWER.service" && ! -f "/lib/systemd/system/$KEY_LOWER.service" ]]; then
        cat > /etc/systemd/system/$KEY_LOWER.service <<EOF
[Unit]
Description=${KEY} Service
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/$KEY_LOWER/$KEY_LOWER -config /etc/$KEY_LOWER/config.json
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
        systemctl enable $KEY_LOWER.service
    fi
}

Help(){
  cat - 1>& 2 << EOF
./go.sh [-h] [-c] [--remove] [-p proxy] [-f] [--version vx.y.z] [-l file] [-x]
  -h, --help            Show help
  -p, --proxy           To download through a proxy server, use -p socks5://127.0.0.1:1080 or -p http://127.0.0.1:3128 etc
  -f, --force           Force install
      --version         Install a particular version, use --version v3.15
  -l, --local           Install from a local file
      --remove          Remove installed V2Ray/Xray
  -x, --xray            Xray mod
  -c, --check           Check for update
EOF
}

remove(){
    if [[ -n "${SYSTEMCTL_CMD}" ]] && [[ -f "/etc/systemd/system/$KEY_LOWER.service" ]];then
        if pgrep "$KEY_LOWER" > /dev/null ; then
            stopV2ray
        fi
        systemctl disable $KEY_LOWER.service
        rm -rf "/usr/bin/$KEY_LOWER" "/etc/systemd/system/$KEY_LOWER.service"
        if [[ $? -ne 0 ]]; then
            colorEcho ${RED} "Falha ao remover $KEY."
            return 0
        else
            colorEcho ${GREEN} "Removido $KEY com sucesso."
            colorEcho ${BLUE} "Se necessário, remova o arquivo de configuração e o arquivo de log manualmente. "
            return 0
        fi
    elif [[ -n "${SYSTEMCTL_CMD}" ]] && [[ -f "/lib/systemd/system/$KEY_LOWER.service" ]];then
        if pgrep "$KEY_LOWER" > /dev/null ; then
            stopV2ray
        fi
        systemctl disable $KEY_LOWER.service
        rm -rf "/usr/bin/$KEY_LOWER" "/lib/systemd/system/$KEY_LOWER.service"
        if [[ $? -ne 0 ]]; then
            colorEcho ${RED} "Falha ao remover $KEY."
            return 0
        else
            colorEcho ${GREEN} "Removido $KEY com sucesso."
            colorEcho ${BLUE} "Se necessário, remova o arquivo de configuração e o arquivo de log manualmente. "
            return 0
        fi
    else
        colorEcho ${YELLOW} "$KEY não encontrado."
        return 0
    fi
}

checkUpdate(){
    echo "Verificando atualizações."
    VERSION=""
    getVersion
    RETVAL="$?"
    if [[ $RETVAL -eq 1 ]]; then
        colorEcho ${BLUE} "Nova versão encontrada ${NEW_VER} por $KEY.(Versão Atual:$CUR_VER)"
    elif [[ $RETVAL -eq 0 ]]; then
        colorEcho ${BLUE} "Nenhuma nova versão. A versão atual é ${NEW_VER}."
    elif [[ $RETVAL -eq 2 ]]; then
        colorEcho ${YELLOW} "Não $KEY instalado."
        colorEcho ${BLUE} "A versão mais recente para $KEY é ${NEW_VER}."
    fi
    return 0
}

main(){
    #helping information
    [[ "$HELP" == "1" ]] && Help && return
    [[ "$CHECK" == "1" ]] && checkUpdate && return
    [[ "$REMOVE" == "1" ]] && remove && return

    local ARCH=$(uname -m)
    archAffix

    # extract local file
    if [[ $LOCAL_INSTALL -eq 1 ]]; then
        colorEcho ${YELLOW} "Instalando $KEY via arquivo local. Certifique-se de que o arquivo é válido $KEY pacote, pois não somos capazes de determinar isso."
        NEW_VER=local
        rm -rf /tmp/$KEY_LOWER
        ZIPFILE="$LOCAL"
    else
        # download via network and extract
        installSoftware "curl" || return $?
        getVersion
        RETVAL="$?"
        if [[ $RETVAL == 0 ]] && [[ "$FORCE" != "1" ]]; then
            colorEcho ${BLUE} "Última versão ${CUR_VER} já está instalado."
            if [ -n "${ERROR_IF_UPTODATE}" ]; then
              return 10
            fi
            return
        elif [[ $RETVAL == 3 ]]; then
            return 3
        else
            colorEcho ${BLUE} "Instalando $KEY ${NEW_VER} sobre ${ARCH}"
            downloadV2Ray || return $?
        fi
    fi

    local ZIPROOT="$(zipRoot "${ZIPFILE}")"
    installSoftware unzip || return $?

    if [ -n "${EXTRACT_ONLY}" ]; then
        colorEcho ${BLUE} "Extraindo $KEY pacote para ${VSRC_ROOT}."

        if unzip -o "${ZIPFILE}" -d ${VSRC_ROOT}; then
            colorEcho ${GREEN} "$KEY extraído para ${VSRC_ROOT%/}${ZIPROOT:+/${ZIPROOT%/}}, e saindo..."
            return 0
        else
            colorEcho ${RED} "Falha ao extrair $KEY."
            return 2
        fi
    fi

    if pgrep "$KEY_LOWER" > /dev/null ; then
        V2RAY_RUNNING=1
        stopV2ray
    fi
    installV2Ray "${ZIPFILE}" "${ZIPROOT}" || return $?
    installInitScript "${ZIPFILE}" "${ZIPROOT}" || return $?
    if [[ ${V2RAY_RUNNING} -eq 1 ]];then
        colorEcho ${BLUE} "Reiniciando $KEY serviço."
        startV2ray
    fi
    colorEcho ${GREEN} "$KEY ${NEW_VER} está instalado."
    rm -rf /tmp/$KEY_LOWER
    return 0
}

main