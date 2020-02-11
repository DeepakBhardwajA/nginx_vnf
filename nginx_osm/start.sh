#!/bin/bash
date > /tngbench_share/start.txt

#echo "Starting Promethues exporter..."
#python3 prometheus_exporter.py &#> exporter.log &

nginx -f /etc/nginx/nginx.conf -D # &

echo "Nginx VNF started ..."
