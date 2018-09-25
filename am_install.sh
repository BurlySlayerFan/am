#!/bin/bash
export workspace="$(echo $HOME)/am/am"

# default installation variables
port=8080
context="openam"
admin_pwd="password"
cfg_dir="$(echo $HOME/openam)"
cookie_domain=$hostname

# press enter for default installation or enter anything else to start a custom installation
echo "Install type? (default)"
read install_type
install_type=${install_type:-default}

if [ $install_type != "default" ]; then
        echo "HTTP?"
        read protocol
        protocol=${protocol:-http}

        echo "Hostname? (openam.example.com)"
        read hostname
        hostname=${hostname:-openam.example.com}

        echo "Port (8080)"
        read port
        port=${port:-8080}

        echo "Context (openam)"
        read context
        context=${context:-openam}

        echo "Password (password)"
        read admin_pwd
        admin_pwd=${admin_pwd:-password}

        echo "Config Directory ($HOME/openam)"
        read cfg_dir
        cfg_dir=${cfg_dir:-$(echo $HOME/openam)}

        echo "Cookie Domain ($hostname)"
        read cookie_domain
        cookie_domain=${cookie_domain:-"$hostname"}

        export host=$protocol://$hostname:$port/$context
        export admin_pwd
else
        export host=$protocol://$hostname:$port/$context
        export admin_pwd
fi

$workspace/amster_6/amster $workspace/amster_scripts/am_basic_install/am_install.amster -D HOST=${host} -D ADMIN_PWD=${admin_pwd} -D CFG_DIR=${cfg_dir} -D COOKIE_DOMAIN=${cookie_domain}
