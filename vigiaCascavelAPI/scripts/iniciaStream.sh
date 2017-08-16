#!/bin/bash
#
# Inicia um stream baseado em um ID e URL informado
#

id=$1
url=$2
rm -rf /var/www/html/$id/*
mkdir -p /var/www/html/$id
nohup ffmpeg -rtsp_transport tcp -i "$url" -fflags flush_packets -max_delay 2 -reset_timestamps 1 -flags -global_header -hls_time 2 -hls_list_size 10 -f hls -hls_flags delete_segments -use_localtime 1 -vcodec copy -y /var/www/html/$id/stream.m3u8 &
