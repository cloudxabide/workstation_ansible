#!/bin/bash

# Purpose:  pre-steps specific to Fedora (this *might* just become a linux/common thing though)

# If a /data mount exists, I want to use that for user's home directories
if [ -d /data ]
then 
  sudo mkdir /data/home
  cp -Rp /home/$USER /data/home
  echo "/data/home /home none bind,defaults 0 0" | sudo tee -a /etc/fstab
  systemctl daemon-reload
fi

# Customize environment for Morpheus
# Add TMPFS mount for user:morpheus
grep morpheus /etc/fstab
if [ $? -ne 0 ]
then
  echo "# TMPFS Mount" | sudo tee -a /etc/fstab
  echo "tmpfs   /home/morpheus tmpfs  rw,size=1G,nr_inodes=5k,noexec,nodev,nosuid,uid=2020,gid=2020,mode=1700   0  0"  | sudo tee -a  /etc/fstab
  sudo mkdir /home/morpheus
fi
sudo systemctl daemon-reload

id -u morpheus &>/dev/null || sudo useradd -u2020 -c "Morpheus" -p '$6$MIxbq9WNh2oCmaqT$10PxCiJVStBELFM.AKTV3RqRUmqGryrpIStH5wl6YNpAtaQw.Nc/lkk0FT9RdnKlEJEuB81af6GWoBnPFKqIh.' morpheus

