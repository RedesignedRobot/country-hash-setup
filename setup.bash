#!/usr/bin/env bash

#!/usr/bin/env bash
apt update
apt upgrade -y
docker run -d -p 5000:5000 --name client amirayub/hash-rest-service
docker run -d -p 80:80 --name service amirayub/secure-hash-client
docker run -d -p 27017-27019:27017-27019 --name mongodb mongo
docker exec -d mongodb bash apt update
docker exec -d mongodb bash apt upgrade
docker exec -d mongodb bash apt install git
docker exec -d mongodb bash cd home/
docker exec -d mongodb bash git clone https://github.com/ozlerhakan/mongodb-json-files.git
docker exec -d mongodb bash cd mongodb-json-files/datasets/
docker exec -d mongodb bash mongoimport --db dev --collection cb --file countries-big.json
