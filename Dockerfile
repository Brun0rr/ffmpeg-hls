FROM ubuntu:16.04
MAINTAINER Bruno Ricardo Rodrigues
ADD vigiaCascavelAPI /opt/vigiaCascavelAPI
RUN apt-get update && \
	apt-get install -y ffmpeg nodejs npm apache2 cron && apt-get clean && \
	ln -s /usr/bin/nodejs /usr/bin/node && \
	a2enmod headers && \
	cd /opt/vigiaCascavelAPI && npm install
ADD crontab /etc/crontab
ADD 000-default.conf /etc/apache2/sites-available/000-default.conf
LABEL Description="FFMPEG"
ENTRYPOINT ["/opt/vigiaCascavelAPI/scripts/vigiaCascavelAPI.sh"]
WORKDIR /opt/vigiaCascavelAPI
EXPOSE 80 4000
