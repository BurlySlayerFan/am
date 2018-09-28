#!/bin/bash
export workspace="$(echo $HOME)/am/am"

# default installation variables
protocol=http
hostname=openam.example.com
port=8080
context=openam
admin_pwd=password
cfg_dir="$(echo $HOME/openam)"
cookie_domain=$hostname

# press enter for default installation or enter anything else to start a custom installation
echo "Install type? (hit enter for default install or type anything else for a custom install)"
read install_type
install_type=${install_type:-default}

if [ $install_type != "default" ]; then
        echo "Protocol ($protocol)?"
        read response
        protocol=${response:-$protocol}

        echo "Hostname? ($hostname)"
        read response
        hostname=${response:-$hostname}

        echo "Port ($port)"
        read response
        port=${response:-$port}

        echo "Context ($context)"
        read response
        context=${response:-$context}

        echo "Password ($admin_pwd)"
        read response
        admin_pwd=${response:-$admin_pwd}

        echo "Config Directory ($cfg_dir)"
        read response
        cfg_dir=${response:-$cfg_dir}

        echo "Cookie Domain ($hostname)"
        read response
        cookie_domain=${response:-$hostname}

        export host=$protocol://$hostname:$port/$context
        export admin_pwd
else
        export host=$protocol://$hostname:$port/$context
        export admin_pwd
fi

$workspace/amster_6/amster $workspace/amster_scripts/am_basic_install/am_install.amster -D HOST=${host} -D ADMIN_PWD=${admin_pwd} -D CFG_DIR=${cfg_dir} -D COOKIE_DOMAIN=${cookie_domain}
