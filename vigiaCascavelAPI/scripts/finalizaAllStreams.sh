#!/bin/bash
#
# Rodar quando necessário. Finaliza todos os streams que estiverem rodando e apaga suas respectivas pastas
#

pkill -15 ffmpeg
sleep 2
rm -rf /var/www/html/*
echo "Processos finalizados"
