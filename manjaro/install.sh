clear &&
    sleep 2s
echo "#--------------------Iniciando atualização do sistema--------------------#"
echo ""

#sincronização total/procura por atualização.
sudo pacman -Syyu --noconfirm
#sincroniza os repositórios/procura por atualização
sudo pacman -Syu --noconfirm

sleep 2s
echo "#--------------------Instalando pacotes essenciais--------------------#"
echo ""

sudo pacman -S base-devel --noconfirm --needed
sudo pacman -S lutris --noconfirm --needed
sudo pacman -S wine --noconfirm --needed
sudo pacman -S ttf-fira-code --noconfirm --needed
sudo pacman -S vlc --noconfirm --needed
sudo pacman -S spotify --noconfirm --needed
sudo pacman -S steam --noconfirm --needed

sleep 2s
echo "#--------------------Instalando pacotes AUR--------------------#"
echo ""

pamac install yay
yay -S visual-studio-code-bin --noconfirm --needed
sudo pacman -Syu wine winetricks wine-mono wine_gecko vulkan-icd-loader lib32-vulkan-icd-loader vkd3d lib32-vkd3d gvfs --noconfirm --needed

sleep 2s
# echo "#--------------------Instalando drivers Nvidia 470xx--------------------#"
# echo ""

# #install nvidia drivers
# yay -S linux515-headers
# yay -S nvidia-470xx-dkms --needed --noconfirm
# sudo pacman -S nvidia-470xx-dkms --needed --noconfirm
sudo pacman -S --needed nvidia-470xx-dkms

# sleep 2s
echo "#--------------------Instalando pacotes flatpak--------------------#"
echo ""

#Flatpaks
sudo pacman -S flatpak --noconfirm --needed
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak --system install flathub com.mattjakeman.ExtensionManager -y
flatpak --system install flathub net.davidotek.pupgui2 -y
sleep 2s
echo "#--------------------Configurações para git commit--------------------#"
echo ""

#git config
git config --global user.email lpdmonteiro@gmail.com
git config --global user.name Leonam Monteiro

sleep 2s
echo "#--------------------Atualizando Sistema--------------------#"
echo ""

systemctl restart systemd-binfmt
#sincroniza os repositórios/procura por atualização
sudo pacman -Syu --noconfirm
