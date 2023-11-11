clear &&
    sleep 2s
echo "#--------------------Iniciando atualização do sistema--------------------#"
echo ""
#sincronização total/procura por atualização.
sudo pacman -Syyu --noconfirm
#sincroniza os repositórios/procura por atualização
sudo pacman -Syu --noconfirm
