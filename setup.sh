#!/bin/bash
apt update
apt upgrade -y
apt install mongodb-clients -y
apt install vim -y
docker run -d -p 5000:5000 --name service amirayub/hash-rest-service
docker run -d -p 80:80 --name client amirayub/secure-hash-client
docker run -d -p 27017-27019:27017-27019 --name mongodb mongo
docker exec mongodb apt update
docker exec mongodb apt upgrade -y
docker exec mongodb apt install git -y
docker exec mongodb git clone https://github.com/ozlerhakan/mongodb-json-files.git
docker exec mongodb mongoimport --db dev --collection cb --file mongodb-json-files/datasets/countries-big.json
docker container ls
docker logs service
docker logs client
