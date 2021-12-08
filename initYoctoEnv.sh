#!/bin/bash

# Initialize Yocto projet for Intel NUC with docker
# Need admin rights
# cmd : sudo ./initYoctoEnv.sh <YOCTO_PATH>

YOCTO_PATH=$1
YOCTO_BRANCH='dunfell'
MACHINE='qemux86-64'

if [ -z "$1" ]
  then
    echo "Error. No argument supplied, cmd : sh initYoctoEnv.sh <YOCTO_PATH> (~/ for example)"
    exit
fi

echo "******************************************************************************"
echo "*                     Yocto environement for NUC initialized                 *"
echo "******************************************************************************"
echo "*  Machine : ${MACHINE}                                                      *"
echo "*  Yocto Version : ${YOCTO_BRANCH}                                           *"
echo "*  Yocto path : ${YOCTO_PATH}                                                *"
echo "******************************************************************************"

# Installs the required tools for yocto
apt-get install gawk wget git diffstat unzip texinfo gcc build-essential chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev pylint3 xterm python3-subunit mesa-common-dev

# Create yocto repo dir 
mkdir -p ${YOCTO_PATH}/yocto/sources

# Clone yocto project git repo in your workspace
cd ${YOCTO_PATH}/yocto/sources/
git clone -b ${YOCTO_BRANCH} git://git.yoctoproject.org/poky

# Initialize yocto environment
cd ${YOCTO_PATH}/yocto/sources/poky/
source oe-init-build-env build

# Clone layers 
# cd ${YOCTO_PATH}/yocto/sources/
# git clone -b ${YOCTO_BRANCH} git://git.yoctoproject.org/meta-XXXX


# Clone custom layer
# cd ${YOCTO_PATH}/
# git clone -b ${YOCTO_BRANCH} git@ssh.dev.azure.com:v3/XXX
# ln -sf ${YOCTO_PATH}/XXX ${YOCTO_PATH}/yocto/sources/XXX


# Adds layers to bblayers.conf file
# cd ${YOCTO_PATH}/yocto/sources/poky/build/
# bitbake-layers add-layer "${YOCTO_PATH}/yocto/sources/meta-XXX/"



# Link poky/build/conf git repo
# ln -sf ${YOCTO_PATH}/XXX/poky/build/conf ${YOCTO_PATH}/yocto/sources/poky/build/


# Update yocto env with new parameters
# cd ${YOCTO_PATH}/yocto/sources/poky/
# source oe-init-build-env

#First image compilation 
clear
echo "******************************************************************************"
echo "*                Yocto environement for NUC is completed                     *"
echo "******************************************************************************"
echo "You can now execute the first compilation : "
echo "cd ${YOCTO_PATH}/yocto/sources/poky/"
echo "source oe-init-build-env"
echo "bitbake core-image-weston"
echo ""
