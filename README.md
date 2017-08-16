# ffmpeg-hls
Stream RTSP over HTTP (FFMPEG + HLS)

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
URL: http://localhost/id/stream.m3u8

# Routes
- POST - http://localhost/camera/stream
- GET - http://localhost/killall/streams
- GET - http://localhost/statusAPI
- GET - http://localhost/id/stream.m3u8
