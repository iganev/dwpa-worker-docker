FROM debian:stretch-slim

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y logrotate git wget nano screen python3 python3-openssl procps \
                        openssl libssl1.1 libssl1.0.2 libssl1.0-dev zlib1g-dev \
                        libnss3 libnss3-dev libkrb5-3 libkrb5-dev libgmp10 libgmp-dev \
                        libbz2-1.0 libbz2-dev libpcap0.8 libpcap0.8-dev make gcc

COPY dwpa_worker.logrotate /etc/logrotate.d/dwpa_worker
                        
WORKDIR /root
RUN mkdir bin

WORKDIR /root/bin
RUN git clone https://github.com/magnumripper/JohnTheRipper.git

WORKDIR /root/bin/JohnTheRipper/src
RUN ./configure && make && make install
    
RUN ln -s /usr/bin/python3 /usr/bin/python
    
WORKDIR /root/bin
RUN mkdir dwpa

COPY help_crack.py /root/bin/dwpa/
COPY help_crack.py.version /root/bin/dwpa/
COPY ./*.sh /root/bin/

WORKDIR /root/bin
CMD ["./start.sh"]
