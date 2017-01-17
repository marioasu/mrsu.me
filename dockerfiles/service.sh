#!/bin/bash
dir=`dirname $0`
PROJECT_NAME=$(cat $dir/docker-compose.yml | grep PROJECT_NAME | cut -d = -f 2)
name=${PROJECT_NAME:-mrsu}
docker-compose -f $dir/docker-compose.yml -p $name "$@"
