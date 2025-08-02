#!/usr/bin/env sh

echo "Instalando ferramentas para desenvolvimento full-stack com npm..."

# Instalar TypeScript Language Server (tsserver)
sudo npm install -g typescript-language-server typescript

# Instalar ESLint Language Server
sudo npm install -g eslint_d

# Instalar Prettier Language Server (usado por alguns editores, ou use o Prettier CLI diretamente)
sudo npm install -g prettier

# Instalar Volar (Vue.js Language Server)
sudo npm install -g @vue/language-server

# Instalar Angular Language Service
sudo npm install -g @angular/language-service

# Instalar JSON Language Server
sudo npm install -g vscode-json-languageserver

# Instalar YAML Language Server
sudo npm install -g yaml-language-server

# Instalar Docker Language Server (opcional, se você trabalha muito com Dockerfiles)
sudo npm install -g dockerfile-language-server-nodejs

echo "Instalação com npm concluída."

echo "Instalando ferramentas para desenvolvimento full-stack com pacman..."

# Instalar Node.js e npm (se ainda não tiver)
sudo pacman -S --noconfirm nodejs npm

# Instalar Python e pip (se ainda não tiver)
sudo pacman -S --noconfirm python python-pip

# Instalar Language Server para Python (pylsp ou pyright)
# Você pode escolher um. pyright é da Microsoft e é bem rápido.
# This environment is externally managed
#╰─> To install Python packages system-wide, try 'pacman -S
#    python-xyz', where xyz is the package you are trying to
#    install.
#
#    If you wish to install a non-Arch-packaged Python package,
#    create a virtual environment using 'python -m venv path/to/venv'.
#    Then use path/to/venv/bin/python and path/to/venv/bin/pip.
#
#    If you wish to install a non-Arch packaged Python application,
#    it may be easiest to use 'pipx install xyz', which will manage a
#    virtual environment for you. Make sure you have python-pipx
#    installed via pacman.

sudo pacman -S --noconfirm python-lsp-server python-lsp-black pyright

# Instalar Language Server para Rust (rust-analyzer)
sudo pacman -S --noconfirm rust-analyzer

# Instalar Language Server para Go (gopls)
sudo pacman -S --noconfirm go # Instala o Go
# Em seguida, instale o gopls usando o go:
go install golang.org/x/tools/gopls@latest

# Instalar Language Server para PHP (php-language-server ou intelephense via Composer)
# Geralmente o php-language-server é instalado via Composer.
# Exemplo (se você tiver Composer): composer global require felixfbecker/language-server

# Instalar Deno Language Server (se você usa Deno)
# Instale Deno primeiro: sudo pacman -S --noconfirm deno
# O Deno LSP vem integrado com o Deno, não precisa de instalação separada.

echo "Instalação com pacman e outros gerenciadores de pacotes concluída."
