clear &&
  sleep 2s
echo "#--------------------Atualizando Pacman Mirrors-------------------->"
echo ""
sudo pacman-mirrors --fasttrack 20
sudo pacman -S archlinux-keyring --noconfirm --needed
sudo pacman -Rns gedit --noconfirm --needed
sudo pacman -Rdd webkit2gtk-5.0 --noconfirm --needed
sudo pacman -Syu glibc-locales --overwrite /usr/lib/locale/\*/\* --noconfirm --needed
sleep 2s
echo "#--------------------Atualizando Sistema-------------------->"
echo ""
#sincronização total/procura por atualização.
sudo pacman -Syyu --noconfirm --needed
#sincroniza os repositórios/procura por atualização
sudo pacman -Syu --noconfirm --needed
