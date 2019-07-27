#!/bin/bash
docker stop $(docker ps -aq)
docker system prune -a
git pull