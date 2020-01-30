#!/bin/bash
date > /tngbench_share/start.txt

# modify config using ENV vars
sed -i 's/TCP_LISTEN_PORT/'"$TCP_LISTEN_PORT"'/g' /etc/nginx/nginx.conf
sed -i 's/TCP_SERVERS/'"$TCP_SERVERS"'/g' /etc/nginx/nginx.conf
sed -i 's/UDP_LISTEN_PORT/'"$UDP_LISTEN_PORT"'/g' /etc/nginx/nginx.conf
sed -i 's/UDP_SERVERS/'"$UDP_SERVERS"'/g' /etc/nginx/nginx.conf

echo "Starting Promethues exporter..."
python3 prometheus_exporter.py &#> exporter.log &

nginx &

echo "Nginx VNF started ..."
