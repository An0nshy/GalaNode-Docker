#!/bin/bash

if [ $1 == "auth" ]
then
    echo "Start Gala Auth"
    docker run --name galaNode shayer91/galanode:2.3.2 config device
    docker cp galaNode:/opt/gala-headless-node/config.json ./config/config.json
    docker rm galaNode
fi

if [ $1 == "node" ]
then
    echo "Start Gala Node"
    docker run -d --name galaNode -v $pwd/config/config.json:/opt/gala-headless-node/config.json shayer91/galanode:2.3.2 daemon
fi