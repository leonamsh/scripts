#!/bin/bash
echo "#--------------------Instalando drivers Nvidia 470xx--------------------#"
echo ""

#install linux headers for your current linux kernel (use uname -r to see current kernel version)

sudo pacman -S linux515-headers --noconfirm

#install nvidia drivers
paru -S nvidia-470xx-dkms --noconfirm
