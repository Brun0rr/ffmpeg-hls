#!/bin/bash
#
# Script que inicia todos os serviços
#

/etc/init.d/apache2 start
sleep 2
/etc/init.d/cron start
sleep 2
cd /opt/vigiaCascavelAPI/
npm start
