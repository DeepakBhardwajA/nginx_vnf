#!/bin/bash
date > /tngbench_share/start.txt
while true;
do
 case "$1"
 in
 mp.input) shift;INPUT=$1;;
 mp.output1) shift;OUTPUT1=$1;;
 mp.output2) shift;OUTPUT2=$1;;
 vnf) shift;VNF=$1;;
 esac
 shift;
 if [ "$1" = "" ]; then
  break
 fi
done
echo "Apache Bench started ..."
#ab -c 999 -r -t 60 -n 9999999 -e /tngbench_share/ab_logs2.csv -s 60 -k -X $VNF:3128 http://www.baidu.com/
#ab -c 999 -r -t 60 -n 9999999 -e /tngbench_share/ab_logs2.csv -s 60 -k -X $VNF:3128 http://$OUTPUT/
ab -c 1 -t 60 -n 10000 -e /tngbench_share/ab_logs.csv -s 60 -k -i http://$VNF:8888/
