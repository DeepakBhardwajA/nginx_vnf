FROM ubuntu:xenial
MAINTAINER Deepak Bhardwaj

# define interface names (should be the same as in VNFD)
ENV IFIN input
ENV IFOUT output

# define
ENV TCP_LISTEN_PORT 8888
ENV TCP_SERVERS server 40.0.0.254:80;
ENV UDP_LISTEN_PORT 8888
ENV UDP_SERVERS server 40.0.0.254:80;

RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install -y -q \
	net-tools \
	iproute \
	inetutils-ping \
	nginx \
  python \
	python-yaml \
	curl \
	python3 \
	python3-pip

#RUN pip3 install flatten_json
#RUN pip3 install prometheus_client

ADD start.sh start.sh
RUN chmod +x start.sh
ADD stop.sh stop.sh
RUN chmod +x stop.sh
ADD nginx.conf /etc/nginx/nginx.conf

#ADD www /var/www/html

ADD log_intf_statistics.py log_intf_statistics.py

WORKDIR /

RUN mkdir /tngbench_share

# normal entry point
CMD /bin/bash
