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

sleep 2s
echo "#--------------------Instalando pacotes AUR--------------------#"
echo ""

pamac install yay
yay -S paru --noconfirm
paru -S visual-studio-code-bin --noconfirm

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
#sincroniza os repositórios do Manjaro Linux.
sudo pacman -Syy --noconfirm

#sincroniza os repositórios/procura por atualização
sudo pacman -Syu --noconfirm

#sincronização total/procura por atualização.
sudo pacman -Syyu --noconfirm
