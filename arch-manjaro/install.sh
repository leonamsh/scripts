clear&&
sleep 2s
echo "#--------------------Iniciando atualização do sistema--------------------#"
echo ""

#sincroniza os repositórios do Manjaro Linux.
sudo pacman -Syy --noconfirm

#sincroniza os repositórios/procura por atualização
sudo pacman -Syu --noconfirm

#sincronização total/procura por atualização.
sudo pacman -Syyu --noconfirm

sleep 2s
echo "#--------------------Instalando pacotes essenciais--------------------#"
echo ""

sudo pacman -S --needed base-devel --noconfirm
sudo pacman -S thunar --noconfirm
sudo pamcan -S alacritty --noconfirm
sudo pacman -S sxhkd --noconfirm
sudo pacman -S qtile --noconfirm
sudo pacman -S xterm --noconfirm
sudo pacman -S dmenu --noconfirm
sudo pacman -S rofi --noconfirm
sudo pacman -S variety --noconfirm
yay -S paru --noconfirm

sleep 2s
echo "#--------------------Instalando drivers Nvidia 470xx--------------------#"
echo ""

#install nvidia drivers
paru -S nvidia-470xx-dkms --needed --noconfirm

sleep 2s
echo "#--------------------Instalando pacotes flatpak--------------------#"
echo ""

#Flatpaks
sudo pacman -S flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.mattjakeman.ExtensionManager -y

sleep 2s
echo "#--------------------Configurações para git commit--------------------#"
echo ""

#git config
git config --global user.email lpdmonteiro@gmail.com
git config --global user.name Leonam Monteiro

sleep 2s
echo "#--------------------Atualizando Sistema--------------------#"
echo ""

#sincroniza os repositórios do Manjaro Linux.
sudo pacman -Syy --noconfirm

#sincroniza os repositórios/procura por atualização
sudo pacman -Syu --noconfirm

#sincronização total/procura por atualização.
sudo pacman -Syyu --noconfirm