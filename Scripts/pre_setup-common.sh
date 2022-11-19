#!/bin/bash

# Purpose:  we need to install git and ansible to run the playbooks
#   Notes:  This will ask for your sudo password.  If you do not *have* sudo access, this will fail.

# To run this script
# curl (options) https://raw.githubusercontent.com/cloudxabide/workstation_ansible/main/Scripts/pre_setup.sh | bash -s

GIT_USER=cloudxabide
REPO_NAME=workstation_ansible

# Figure out what OS we are managing (fedora|ubuntu)
OS_ID=$(grep ^ID= /etc/*release* | awk -F\= '{ print $2 }')

# This is the "better" way to get the OS:ID - but, I have discovered that lsb_release is not always present
#( which lsb_release ) || { dnf -y install redhat-lsb-core; apt -y install apt-get install -y lsb-release && apt-get clean all; }
#OS_ID=$(lsb_release -is )

case $OS_ID in
  fedora)
    PKG_MGR=$(which dnf)
  ;;
  ubuntu)
    PKG_MGR=$(which apt)
  ;;
  *)
    echo "ERROR:  unsupported OS = $OS_ID"
    exit 9
  ;;
esac

# Install base packages to execute update
sudo $PKG_MGR -y install git ansible

# Clone this repo to local machine
mkdir -p ${HOME}/Repositories/Personal/${GIT_USER}; cd $_
git clone https://github.com/${GIT_USER}/${REPO_NAME}
cd ${REPO_NAME}

# Update sudo
echo "$USER ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/$USER
sudo restorecon -RFvv /etc/sudoers.d/$USER
#
echo "Note:  time to go run some playbooks"
