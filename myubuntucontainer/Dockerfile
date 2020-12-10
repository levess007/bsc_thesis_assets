FROM ubuntu:focal

RUN apt-get update && apt-get install -y\
	curl\
	nmap\
	htop\
	net-tools\
	tcpdump\
	iproute2\
	iputils-ping\
	iputils-arping\
	traceroute\
	dnsutils\
	nmap\
	whois\
	conntrack\
	iptables\
	bmon\
	iperf\
	nginx\
	ipvsadm\
	conntrackd\
	vim\
    && rm -rf /var/lib/apt/lists/* 

EXPOSE 80

COPY ./nginx /etc/nginx

#ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
CMD ["tail","-f","/dev/null"]
