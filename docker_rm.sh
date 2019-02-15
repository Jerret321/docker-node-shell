#!/bin/bash
docker rm -f $(docker ps -a -q)
# 删除所有 none的images
docker rmi -f  $(docker images | grep "^<none>" | awk "{print $3}")
