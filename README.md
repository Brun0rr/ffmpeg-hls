# ffmpeg-hls
Stream RTSP over HTTP (FFMPEG + HLS)

# Container
https://hub.docker.com/r/brunorrodrigues/ffmpeg/

# Build Container
docker build -t ffmpeg:1.0 .

# Run Container
docker run -d -p 80:80 -p 4000:4000 --name ffmpeg-hls ffmpeg:1.0

# Usage
URL: http://localhost/camera/stream
* Response Format: JSON
* Request Parameters: id, url
+ id: Integer ---> Must be uniqueurl: String
+ url: String ---> String RTSP from camera stream

# Get Stream
URL: http://localhost/id/stream.m3u8 (Substituir o "id" pelo mesmo id utilizado no comando anterior.)

#Scripts Cron
O containers está configurado para rodar 2 scripts.
- 1º - Se existir streams iniciados, porém sem acesso a mais de 2 minutos. O script ira encerrar o stream e limpar os arquivos existentes em /var/www/html/id (Onde ID é o ID da camera).
- 2º - Limpa dos arquivos de stream que não estão mais sendo executadas e por algum motivo, não foi possível remover os arquivos.

# Routes
- POST - http://localhost/camera/stream = Inicia o Stream de uma câmera.
- GET - http://localhost/killall/streams = Finaliza todos os streams e remove todos os arquivos.
- GET - http://localhost/statusAPI = Retorna "OK" para caso a API esteja operacional
- GET - http://localhost/id/stream.m3u8 = Utilizado para visualizar o stream em navegadores, players, etc.
