#!/bin/bash

# Cores para personalizar a saída
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
NC='\033[0m' # Sem cor

LOG_FILE="$HOME/system_update.log"
exec > >(tee -a $LOG_FILE) 2>&1
echo -e "\nLog iniciado em $(date)\n"

START_TIME=$(date +%s)

echo -e "${BLUE}\nAtualizar repositórios e pacotes no Fedora\n"
sudo dnf5 update -y
if [ $? -ne 0 ]; then
  echo -e "${RED}\n[ERRO] Não foi possível atualizar os repositórios.\n"
  exit 1
fi

sudo dnf5 upgrade --refresh -y

echo -e "${CYAN}\nRealizar um dist-upgrade para garantir que tudo está atualizado\n"
sudo dnf5 distro-sync -y

echo -e "${YELLOW}\nRemover pacotes órfãos\n"
sudo dnf5 autoremove -y

echo -e "${YELLOW}\nLimpar o cache do DNF\n"
sudo dnf5 clean all

echo -e "${CYAN}\nAtualizar Flatpaks\n"
flatpak update -y
flatpak uninstall --unused -y

echo -e "${GREEN}\nSistema atualizado com sucesso!\n"

END_TIME=$(date +%s)
ELAPSED_TIME=$((END_TIME - START_TIME))

echo -e "${GREEN}Resumo:\n"
echo -e "${GREEN}1. Repositórios atualizados"
echo -e "${GREEN}2. Pacotes atualizados e sincronizados"
echo -e "${GREEN}3. Pacotes órfãos removidos"
echo -e "${GREEN}4. Cache limpo"
echo -e "${GREEN}5. Flatpaks atualizados"
echo -e "${GREEN}\nTempo total gasto: $ELAPSED_TIME segundos.\n"