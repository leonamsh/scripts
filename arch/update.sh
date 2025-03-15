#!/bin/bash

# Limpa a tela e aguarda 2 segundos para melhor visualização
clear
sleep 2

echo "#-------------------- Iniciando atualização do sistema --------------------#"
echo ""

# Atualiza os repositórios e o sistema
echo "🔄 Atualizando pacotes oficiais..."
if ! sudo pacman -Syyu --noconfirm; then
    echo "❌ Erro ao atualizar pacotes oficiais."
    exit 1
fi

# Atualiza pacotes do AUR usando Paru (se instalado)
if command -v paru &> /dev/null; then
    echo "🔄 Atualizando pacotes do AUR..."
    if ! paru -Syu --noconfirm; then
        echo "❌ Erro ao atualizar pacotes do AUR."
        exit 1
    fi
else
    echo "⚠️ Paru não encontrado. Pulei a atualização do AUR."
fi

# Atualiza os pacotes Flatpak
if command -v flatpak &> /dev/null; then
    echo "🔄 Atualizando pacotes Flatpak..."
    if ! flatpak update -y; then
        echo "❌ Erro ao atualizar pacotes Flatpak."
        exit 1
    fi
else
    echo "⚠️ Flatpak não encontrado. Pulei a atualização de Flatpak."
fi

echo ""
echo "✅ Atualização concluída com sucesso!"

