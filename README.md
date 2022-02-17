# Run your Gala Node in a Dockerized Container #

## Build the Image ##

1. Git clone the Repository
2. `chmod +x start.sh`
3. `./start.sh auth`
  - copy the link displayed in the console and verify with a Gala Account.
4. `./start.sh node`

The node will run in a detached mode. So you dont get any outputs. 
For the logs type:
`docker galaNode logs` or `docker galaNode logs -f` to follow the logs. 

Your Gala Node should login in and start with the sync process.

If you ever have a verification problem just run the ./start.sh auth

Second Option is to use my Docker Image from the Docker Hub.

## Use the Docker Hub Image ##

### For Auth: ### 

`docker run --name galaNode shayer91/galanode:2.3.2 config device`

`docker cp galaNode:/opt/gala-headless-node/config.json ./config/config.json`

`docker rm galaNode`

### Start the Container: ### 

`docker run -d --name galaNode -v $pwd/config/config.json:/opt/gala-headless-node/config.json shayer91/galanode:2.3.2 daemon`
