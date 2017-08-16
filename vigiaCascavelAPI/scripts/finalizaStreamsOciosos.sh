#!/bin/bash
#
# Rodar a cada 3 minutos. Para o stream que ninguem mais esta assistindo e remove as pastas relacionadas
#

ps a | grep ffmpeg | grep stream | tr -s ' ' > /tmp/file
MINATUAL=`date +%M`

while read i; do
  STREAMFILE=`echo $i | awk 'NF>1{print $NF}' | cut -d '/' -f5,6`
  LASTACCESS=`tac /var/log/apache2/access.log | grep -a -m 1 "$STREAMFILE"`
  MINLAST=`echo $LASTACCESS | cut -d":" -f 3`
  MINLAST=$(($MINLAST+2))
  if [ $MINLAST -ge 60 ]; then
    MINLAST=$(($MINLAST-60))
  fi
  if [ $MINLAST -le $MINATUAL ]; then
    PIDPROCESS=`echo $i | cut -d' ' -f 1`
    CAMID=`echo $STREAMFILE | cut -d'/' -f1`
    kill -15 $PIDPROCESS
    sleep 2
    rm -rf /var/www/html/$CAMID
    echo "Matou o processo $PIDPROCESS"
  else
    echo "Não matou nada"
  fi
done < /tmp/file
rm -f /tmp/file
