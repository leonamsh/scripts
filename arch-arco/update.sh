#!/bin/bash
#Remove dependencies that are no longer needed
echo "y" | sudo pacman -Qdtq | pacman -Rs -
#sincroniza os repositórios/procura por atualização
echo "y" | sudo pacman -Syu
#sincronização total/procura por atualização.
echo "y" | sudo pacman -Syyu
#sincroniza os repositórios do Manjaro Linux.
echo "y" | sudo pacman -Syy


