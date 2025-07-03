#!/bin/bash

# Definir variáveis
DRM_PATH="/sys/class/drm"
GRUB_FILE="/etc/default/grub"

# Navegar para a pasta DRM
cd $DRM_PATH || {
  echo "Erro: Pasta $DRM_PATH nao encontrada."
  exit 1
}

echo "Monitores disponíveis:"
ls

echo "Digite o nome do monitor conectado (ex: card0-DP-1):"
read MONITOR

# Extrair apenas a parte "DP-1"
MONITOR_NAME=$(echo "$MONITOR" | grep -oE 'DP-[0-9]+')

# Verificar o status do monitor
if [[ -f "$MONITOR/status" ]]; then
  STATUS=$(cat "$MONITOR/status")
  echo "Status do monitor $MONITOR: $STATUS"
else
  echo "Erro: Monitor $MONITOR nao encontrado."
  exit 1
fi

# Solicitar resolução e taxa de atualização
echo "Digite a resolução desejada (ex: 1440x900):"
read RESOLUTION
echo "Digite a frequência desejada (ex: 75):"
read REFRESH_RATE

# Fazer backup do arquivo grub antes de editar
sudo cp $GRUB_FILE ${GRUB_FILE}.bak

# Adicionar a configuração ao GRUB
sudo sed -i "s/GRUB_CMDLINE_LINUX_DEFAULT='\(.*\)'/GRUB_CMDLINE_LINUX_DEFAULT='\1 video=$MONITOR_NAME:$RESOLUTION@$REFRESH_RATE'/" $GRUB_FILE

echo "\nArquivo GRUB atualizado com sucesso."

echo "\nAtualizando o GRUB..."
# Para sistemas rpm e deb
# sudo update-grub
#
# Para sistemas arch
sudo grub-mkconfig -o /boot/grub/grub.cfg

# Solicitar confirmação para reiniciar
echo "Deseja reiniciar agora? (s/n)"
read RESTART
if [[ "$RESTART" == "s" ]]; then
  echo "Reiniciando..."
  sudo reboot now
else
  echo "Reinicialização cancelada. Por favor, reinicie manualmente para aplicar as alterações."
fi
