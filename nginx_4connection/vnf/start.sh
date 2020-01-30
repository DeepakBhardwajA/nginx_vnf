#!/bin/bash
date > /tngbench_share/start.txt

# modify config using ENV vars
sed -i 's/TCP_LISTEN_PORT/'"$TCP_LISTEN_PORT"'/g' /etc/nginx/nginx.conf
sed -i 's/TCP_SERVER1/'"$TCP_SERVER1"'/g' /etc/nginx/nginx.conf
sed -i 's/TCP_SERVER2/'"$TCP_SERVER2"'/g' /etc/nginx/nginx.conf
sed -i 's/TCP_SERVER3/'"$TCP_SERVER3"'/g' /etc/nginx/nginx.conf
sed -i 's/TCP_SERVER4/'"$TCP_SERVER4"'/g' /etc/nginx/nginx.conf
sed -i 's/UDP_LISTEN_PORT/'"$UDP_LISTEN_PORT"'/g' /etc/nginx/nginx.conf
sed -i 's/UDP_SERVER1/'"$UDP_SERVER1"'/g' /etc/nginx/nginx.conf
sed -i 's/UDP_SERVER2/'"$UDP_SERVER2"'/g' /etc/nginx/nginx.conf
sed -i 's/UDP_SERVER3/'"$UDP_SERVER3"'/g' /etc/nginx/nginx.conf
sed -i 's/UDP_SERVER4/'"$UDP_SERVER4"'/g' /etc/nginx/nginx.conf

# echo "Starting Promethues exporter..."
# python3 prometheus_exporter.py &#> exporter.log &

nginx &

echo "Nginx VNF started ..."
