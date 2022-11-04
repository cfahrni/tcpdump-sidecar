FROM ubuntu
RUN apt-get update 
RUN apt-get install -y tcpdump
ENTRYPOINT tcpdump -n -i eth0 $FILTER