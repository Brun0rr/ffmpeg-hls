FROM brunorrodrigues/ffmpeg:0.1
MAINTAINER Bruno Ricardo Rodrigues
ADD vigiaCascavelAPI /opt/vigiaCascavelAPI
ADD crontab /etc/crontab
RUN cd /opt/vigiaCascavelAPI && npm install
LABEL Description="FFMPEG"
ENTRYPOINT ["/opt/vigiaCascavelAPI/scripts/vigiaCascavelAPI.sh"]
WORKDIR /opt/vigiaCascavelAPI
EXPOSE 80 4000
