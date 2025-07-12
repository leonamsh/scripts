#!/bin/bash

# Criar diretório de montagem
sudo mkdir -p /run/media/Backup

# Listar dispositivos e solicitar escolha do usuário
echo "Dispositivos disponíveis:"
sudo lsblk -o NAME,UUID,MOUNTPOINT,FSTYPE

echo "Digite o nome do dispositivo (ex: sdb2):"
read DEVICE_NAME

# Obter UUID do dispositivo
UUID=$(sudo blkid -s UUID -o value /dev/$DEVICE_NAME)
if [ -z "$UUID" ]; then
    echo "Erro: Não foi possível obter o UUID do dispositivo /dev/$DEVICE_NAME."
    exit 1
fi

# Verificar se já existe uma entrada no fstab
if grep -q "$UUID" /etc/fstab; then
    echo "O UUID já está presente no /etc/fstab. Nenhuma ação necessária."
else
    # Adicionar entrada no fstab
    echo "Adicionando entrada no /etc/fstab..."
    echo "# Mount backup drive $UUID /dev/$DEVICE_NAME" | sudo tee -a /etc/fstab
    echo "UUID=$UUID   /run/media/Backup       ntfs    defaults        0       0" | sudo tee -a /etc/fstab
fi

# Recarregar as configurações do systemd
sudo systemctl daemon-reload

# Montar a unidade
sudo mount -a

echo "Disco montado em /run/media/Backup com sucesso!"
