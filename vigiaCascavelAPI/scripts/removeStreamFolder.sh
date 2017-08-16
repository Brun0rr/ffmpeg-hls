#!/bin/bash
#
# Rodar a cada 3 minutos. Remove as pastas onde os streams não estão mais rodando.
#

for i in `find /var/www/html/* -type d | cut -d / -f 5`; do
  var=$(ps a | grep ffmpeg | grep stream | tr -s ' ' | grep "$i/stream.m3u8")
  if [ -z "$var" ]; then
    rm -rf /var/www/html/$i
  fi
done
