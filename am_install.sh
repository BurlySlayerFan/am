#!/bin/bash
export workspace="$(echo $HOME)/am/am/"

echo "Installing..."
echo "http or https (http)?"
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

#export host="http://openam.example.com:8080/openam"
#export admin_pwd="password"

export host=$protocol://$hostname:$port/$context
export admin_pwd

$workspace/amster_6/amster $workspace/amster_scripts/am_basic_install/am_install.amster -D HOST=${host} -D ADMIN_PWD=${admin_pwd} -D CFGDIR=${cfgDir}
