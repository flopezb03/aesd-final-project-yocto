#!/bin/bash

git submodule init
git submodule sync
git submodule update

source poky/oe-init-build-env


add_layer() {
    layer=$1
    bitbake-layers show-layers | grep "$layer" > /dev/null
    layer_info=$?

    if [ $layer_info -ne 0 ];then
        echo "Adding $layer layer"
        bitbake-layers add-layer ../$layer
    else
        echo "$layer layer already exists"
    fi
}



CONFLINE="MACHINE = \"raspberrypi3-64\""

cat conf/local.conf | grep "${CONFLINE}" > /dev/null
local_conf_info=$?

if [ $local_conf_info -ne 0 ];then
	echo "Append ${CONFLINE} in the local.conf file"
	echo ${CONFLINE} >> conf/local.conf

else
	echo "${CONFLINE} already exists in the local.conf file"
fi

add_layer "meta-openembedded/meta-oe"
add_layer "meta-openembedded/meta-python"
add_layer "meta-openembedded/meta-networking"
add_layer "meta-raspberry"

add_layer "meta-image"

set -e
bitbake aesd-rpi-image

if [ $? -eq 0 ]; then
    cd ..
    bash flash_sd.sh -y
fi
