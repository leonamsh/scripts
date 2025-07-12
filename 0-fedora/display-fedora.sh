#!/bin/bash

# Define monitor parameters
MONITOR_NAME="DP-1"
RESOLUTION="1440x900"
REFRESH_RATE="75"
VIDEO_PARAM="video=${MONITOR_NAME}:${RESOLUTION}@${REFRESH_RATE}"

echo "Configurando os parâmetros de vídeo para o systemd-boot no Fedora..."

# Check if /etc/kernel/cmdline exists and modify it
if [[ -f "/etc/kernel/cmdline" ]]; then
  echo "Modificando /etc/kernel/cmdline..."
  # Remove existing video parameter if it exists
  sudo sed -i '/video=/d' /etc/kernel/cmdline
  # Add the new video parameter
  echo "$VIDEO_PARAM" | sudo tee -a /etc/kernel/cmdline
  echo "Parâmetro de vídeo adicionado: $VIDEO_PARAM"

  # Regenerate kernel entries for systemd-boot
  echo "Regenerando as entradas do kernel para systemd-boot..."
  sudo dracut --regenerate-all --force
  # Alternatively, on some Fedora systems with systemd-boot, you might use:
  # sudo kernel-install add-all
  echo "Entradas do kernel atualizadas. Por favor, reinicie para aplicar as alterações."
else
  echo "Erro: Arquivo /etc/kernel/cmdline não encontrado. Certifique-se de que systemd-boot esteja instalado e configurado corretamente."
  echo "Se você estiver usando GRUB, as configurações são feitas em /etc/default/grub."
fi

# The original set-monitor.sh service might not be necessary if kernel parameters are set directly.
# If you still need a service for other reasons, you would manage it separately.
# For example, if you want a service to always verify the setting on boot, you might still use it.

# Original install.sh content (commented out as direct kernel parameter modification is preferred for video)
# sudo cp /run/media/lm/dev/gitlab/scripts/1-set-monitor-systemd/set-monitor.sh /usr/local/bin/
# sudo cp /run/media/lm/dev/gitlab/scripts/1-set-monitor-systemd/set-monitor.service /etc/systemd/system/
# sudo systemctl enable set-monitor.service

echo "Verificação: Para confirmar se o parâmetro foi aplicado, após reiniciar, execute: cat /proc/cmdline"
