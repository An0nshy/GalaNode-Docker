FROM debian:buster-slim

RUN apt-get update
RUN apt-get install wget -y

RUN apt-get install -qq -y expect
RUN wget https://static.gala.games/node/gala-node.tar.gz
RUN mkdir -p /usr/local/bin/gala-node/
RUN mkdir -p /opt/gala-headless-node

COPY ./config/config.json /opt/gala-headless-node/config.json
COPY ./start.sh /

RUN tar -xzf gala-node.tar.gz --directory /usr/local/bin/gala-node

#RUN ./usr/local/bin/gala-node/gala-node config device
#RUN ./usr/local/bin/gala-node/gala-node config workloads

#COPY gala_node.conf  /opt/gala-headless-node/
#COPY gala.exp  /opt/gala-headless-node/

#RUN chmod 600 /opt/gala-headless-node/gala_node.conf \
#    && chmod +x /opt/gala-headless-node/gala.exp

ENTRYPOINT ["/usr/local/bin/gala-node/gala-node"]
CMD ["daemon"]
