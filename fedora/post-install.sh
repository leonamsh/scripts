#!/bin/bash
echo -e "\n#-------------------- INICIANDO PÓS-INSTALAÇÃO --------------------#\n"
sleep 1

echo -e "\n[+] Atualizando sistema...\n"
sudo dnf update -y

echo -e "\n[+] Instalando pacotes essenciais...\n"
sudo dnf install -y \
  curl unzip git jq @development-tools \
  ntfs-3g gedit emacs \
  fira-code-fonts jetbrains-mono-fonts-all ubuntu-fonts-family \
  alacritty vlc steam lutris goverlay \
  pcmanfm-gtk3 thunar feh wlogout numlockx \
  gvfs dosbox samba xfce4-power-manager lxappearance flameshot

echo -e "\n[+] Instalando bibliotecas para Wine/Gaming...\n"
sudo dnf install -y \
  wine winetricks wine-mono wine-gecko \
  vulkan-loader vulkan-tools \
  mesa-libGL.i686 mesa-vulkan-drivers.i686 \
  giflib.i686 gnutls.i686 v4l-utils.i686 pulseaudio-libs.i686 \
  alsa-lib.i686 libXcomposite.i686 libXinerama.i686 \
  opencl-headers.i686 gstreamer1-plugins-base.i686 SDL2.i686 \
  mesa-dri-drivers mesa-vulkan-drivers \
  zsh-fzf-plugin zsh-autosuggestions \
  zsh-completions zsh-syntax-highlighting \
  fzf neovim nodejs python3 picom rofi dmenu

# Fontes Nerd Fonts - Fedora pode ter pacotes específicos ou pode ser necessário instalar manualmente
# Para fontes Nerd Fonts, verificar pacotes como 'fzf-git-nerd-fonts' ou instalar de fontes baixadas.
# Removi as linhas de instalação de ttf-space-mono-nerd, ttf-iosevka-nerd, ttf-inconsolata-nerd, ttf-jetbrains-mono-nerd
# pois a instalação via dnf pode ter nomes diferentes ou exigir instalação manual.

echo -e "\n[+] Instalando suporte Flatpak...\n"
sudo dnf install -y flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install -y flathub \
  net.davidotek.pupgui2 \
  com.spotify.Client \
  com.mattjakeman.ExtensionManager

echo -e "\n[+] Instalando pacotes adicionais via DNF (substituindo AUR/Paru)...\n"
# Substituição para paru -S visual-studio-code-bin qtile-extras
# Visual Studio Code:
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update
sudo dnf install -y code

# qtile-extras: verificar disponibilidade em repositórios Fedora ou pip
# Se qtile-extras não estiver nos repositórios DNF, pode ser instalado via pip:
# sudo dnf install -y python3-pip
# pip install qtile-extras # Pode ser necessário instalar em um ambiente virtual ou com --user

# Firefox Nightly (opcional, se não usar Flatpak ou versão padrão)
# Removido pois é mais comum usar a versão Flatpak ou a do repositório padrão no Fedora.
# Se realmente precisar, a instalação pode ser manual ou via Flatpak (se disponível).

echo -e "\n[+] Finalizando...\n"
# No Fedora, systemd-binfmt é geralmente ativado por padrão e não requer reinício manual
# Apenas uma atualização final
sudo dnf update -y

echo -e "\n✅ Pós-instalação concluída com sucesso!\n"
