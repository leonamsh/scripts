echo -e "\n#-------------------- INICIANDO PÓS-INSTALAÇÃO --------------------#\n"
sleep 1

echo -e "\n[+] Atualizando sistema...\n"
sudo pacman -Syyu --noconfirm

echo -e "\n[+] Instalando pacotes essenciais...\n"
sudo pacman -S --noconfirm --needed \
    curl unzip git jq base-devel \
    ntfs-3g gedit emacs \
    ttf-fira-code ttf-jetbrains-mono ttf-ubuntu-font-family \
    alacritty vlc steam lutris goverlay \
    pcmanfm-gtk3 thunar feh wlogout numlockx \
    gvfs dosbox samba xfce4-power-manager lxappearance flameshot

echo -e "\n[+] Instalando bibliotecas para Wine/Gaming...\n"
sudo pacman -S --noconfirm --needed \
    wine winetricks wine-mono wine_gecko \
    vulkan-icd-loader lib32-vulkan-icd-loader vkd3d lib32-vkd3d \
    lib32-giflib lib32-gnutls lib32-v4l-utils lib32-libpulse \
    lib32-alsa-lib lib32-libxcomposite lib32-libxinerama \
    lib32-opencl-icd-loader lib32-gst-plugins-base-libs lib32-sdl2 \
    mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon \
    libva-utils fzf-zsh-plugin zsh-autosuggestions \
    zsh-completions zsh-syntax-highlighting ttf-space-mono-nerd \
    ttf-iosevka-nerd ttf-inconsolata-nerd ttf-jetbrains-mono-nerd \
    neovim nodejs python picom rofi dmenu

echo -e "\n[+] Instalando suporte Flatpak...\n"
sudo pacman -S --noconfirm --needed flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install -y flathub \
    net.davidotek.pupgui2 \
    com.spotify.Client \
    com.mattjakeman.ExtensionManager

echo -e "\n[+] Instalando suporte AUR...\n"
if ! command -v paru &>/dev/null; then
    echo "[+] Instalando 'paru' via pamac..."
    pamac install paru --no-confirm || echo "[!] Falha ao instalar paru via pamac. Tente manualmente."
fi

paru -S --noconfirm --needed \
    visual-studio-code-bin qtile-extras
# paru -S firefox-nightly-bin firefox-nightly-i18n-pt-br --noconfirm --needed

echo -e "\n[+] Finalizando...\n"
sudo systemctl restart systemd-binfmt
sudo pacman -Syu --noconfirm

echo -e "\n✅ Pós-instalação concluída com sucesso!\n"
