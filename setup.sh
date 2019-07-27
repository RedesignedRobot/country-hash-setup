#!/bin/bash
apt update
apt upgrade -y
docker run -d -p 5000:5000 --name service amirayub/hash-rest-service
docker run -d -p 80:80 --name client amirayub/secure-hash-client
docker run -d -p 27017-27019:27017-27019 --name mongodb mongo
docker exec mongodb apt update
docker exec mongodb apt upgrade
docker exec mongodb apt install git
docker exec mongodb cd home/
docker exec mongodb git clone https://github.com/ozlerhakan/mongodb-json-files.git
docker exec mongodb cd mongodb-json-files/datasets/
docker exec mongodb mongoimport --db dev --collection cb --file countries-big.json
