# #Install Nvidia driver
# sudo dnf update -y # and reboot if you are not on the latest kernel
# sudo dnf install -y akmod-nvidia # rhel/centos users can use kmod-nvidia instead
# sudo dnf install -y xorg-x11-drv-nvidia-cuda #optional for cuda/nvdec/nvenc support
#Uninstall Nvidia driver
#sudo dnf update -y # and reboot if you are not on the latest kernel
#sudo dnf remove -y akmod-nvidia # rhel/centos users can use kmod-nvidia instead
#sudo dnf remove -y xorg-x11-drv-nvidia-cuda #optional for cuda/nvdec/nvenc support
sudo dnf install xorg-x11-drv-nvidia-470xx akmod-nvidia-470xx xorg-x11-drv-nvidia-470xx-cuda
