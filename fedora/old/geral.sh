#Prepare system to recieve programs
sudo dnf update -y
sudo dnf upgrade --refresh -y
flatpak update -y
#Enabling the RPM Fusion repositories using command-line utilities
sudo dnf install -y \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
#Install Nvidia driver
sudo dnf update -y # and reboot if you are not on the latest kernel
sudo dnf install -y akmod-nvidia # rhel/centos users can use kmod-nvidia instead
sudo dnf install -y xorg-x11-drv-nvidia-cuda #optional for cuda/nvdec/nvenc support
##Install Preload:
sudo dnf copr enable elxreno/preload -y
sudo dnf install -y preload -y
#Install DNFDragora:
sudo dnf install -y dnfdragora
sudo dnf update -y
sudo dnf upgrade --refresh -y
sudo dnf autoremove -y
#Install Multimedia Codecs
sudo dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install -y lame\* --exclude=lame-devel
sudo dnf group upgrade --with-optional Multimedia
#Microsoft Fonts
yum install -y curl cabextract xorg-x11-font-utils fontconfig
rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
## ---- However, if you have a Windows dual-boot, just copying the fonts over from there to ~/.local/share/fonts/ is preferable ----
#Setup Gnome Tweaks
sudo dnf install -y gnome-tweaks
#Install GNOME Extensions:
sudo dnf install -y chrome-gnome-shell gnome-extensions-app
#Setup Dash-To-Dock
sudo dnf install -y gnome-shell-extension-dash-to-dock
#Setup Backup - DejaDup
sudo dnf install -y deja-dup
#Setup Snap
sudo rm /etc/dnf/preferences.d/nosnap.pref
sudo dnf update -y
sudo dnf install -y snapd
sudo dnf install -y snap 
#Install Timeshift backup:
sudo dnf install -y timeshift
sudo dnf install -y -y variety
sudo dnf install -y -y numix-gtk-theme
sudo apt install -y -y numix-icon-theme
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub com.spotify.Client
flatpak install -y flathub org.gimp.GIMP
flatpak install -y flathub org.inkscape.Inkscape
flatpak install -y flathub org.mozilla.Thunderbird
flatpak install -y flathub us.zoom.Zoom
flatpak install -y flathub com.discordapp.Discord
flatpak install -y flathub org.kicad.KiCad
flatpak install -y only office
#Setup Steam
sudo dnf install -y steam
#Setup Lutris
sudo add-dnf-repository -y ppa:lutris-team/lutris
sudo dnf update -y
sudo dnf install lutris -y
#Finishing
sudo dnf update -y
sudo dnf upgrade --refresh -y

