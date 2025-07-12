#!/bin/bash

# Cores para personalizar a saída (com adição de Magenta para destaques)
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m' # Sem cor

# Configurações
LOG_FILE="$HOME/system_update_$(date +%Y-%m-%d_%H-%M-%S).log"
START_TIME=$(date +%s)

# Iniciar log com metadados
{
echo "====================================================="
echo " Atualização do Fedora $(rpm -E %fedora) - KDE Plasma $(plasmashell --version | awk '{print $2}')"
echo " Início: $(date)"
echo " Usuário: $USER"
echo " Hostname: $(hostname)"
echo "====================================================="

# Função para verificar comandos
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Verificar se é root
if [[ $EUID -eq 0 ]]; then
    echo -e "${RED}[ERRO CRÍTICO] Este script não deve ser executado como root!${NC}"
    exit 1
fi

# Verificar conexão com a internet
if ! ping -c 1 google.com >/dev/null 2>&1; then
    echo -e "${RED}[ERRO] Sem conexão com a internet!${NC}"
    exit 1
fi

# --- Atualização do sistema ---
echo -e "${MAGENTA}\n[ETAPA 1/5] Atualizando repositórios e pacotes...${NC}"
sudo dnf5 check-update
sudo dnf5 upgrade --refresh -y || {
    echo -e "${RED}[ERRO] Falha na atualização de pacotes${NC}"
    exit 1
}

# --- Sincronização do sistema ---
echo -e "${MAGENTA}\n[ETAPA 2/5] Sincronizando distribuição...${NC}"
sudo dnf5 distro-sync -y || echo -e "${YELLOW}[AVISO] Problemas na sincronização da distribuição${NC}"

# --- Limpeza do sistema ---
echo -e "${MAGENTA}\n[ETAPA 3/5] Limpando o sistema...${NC}"
sudo dnf5 autoremove -y
sudo dnf5 clean all
sudo package-cleanup --oldkernels --count=2

# --- Atualização Flatpak ---
echo -e "${MAGENTA}\n[ETAPA 4/5] Atualizando Flatpaks...${NC}"
if command_exists flatpak; then
    flatpak update -y
    flatpak uninstall --unused -y
else
    echo -e "${YELLOW}[INFO] Flatpak não está instalado${NC}"
fi

# --- Atualização Firmware (opcional) ---
echo -e "${MAGENTA}\n[ETAPA 5/5] Verificando atualizações de firmware...${NC}"
if command_exists fwupdmgr; then
    sudo fwupdmgr refresh --force
    sudo fwupdmgr update
else
    echo -e "${YELLOW}[INFO] fwupdmgr não instalado${NC}"
fi

# --- Pós-atualização (KDE específico) ---
echo -e "${CYAN}\nExecutando tarefas pós-atualização para KDE Plasma...${NC}"
# Reconstruir cache de ícones
kbuildsycoca5 2>/dev/null
# Recarregar configurações do Plasma
plasmashell --replace >/dev/null 2>&1 &

# --- Relatório final ---
END_TIME=$(date +%s)
ELAPSED_TIME=$((END_TIME - START_TIME))
MINUTES=$((ELAPSED_TIME / 60))
SECONDS=$((ELAPSED_TIME % 60))

echo -e "${GREEN}\n====================================================="
echo " ATUALIZAÇÃO CONCLUÍDA COM SUCESSO!"
echo "====================================================="
echo -e "${GREEN}Tempo total: ${MINUTES}min ${SECONDS}s"
echo -e "${CYAN}Último kernel: $(uname -r)"
echo -e "${CYAN}Última atualização: $(date)\n"

# Verificar se precisa reiniciar
if [ -f /var/run/reboot-required ]; then
    echo -e "${RED}====================================================="
    echo " REINÍCIO NECESSÁRIO!"
    echo "=====================================================${NC}"
    echo -e "Execute: ${MAGENTA}sudo systemctl reboot${NC}"
fi

} | tee "$LOG_FILE"

# Final com instrução
echo -e "${GREEN}Log completo salvo em: ${YELLOW}$LOG_FILE${NC}"
echo -e "${CYAN}Para verificar serviços falhos: ${MAGENTA}systemctl --failed${NC}"
