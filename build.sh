#!/usr/bin/env bash

if [[ $# != 0 ]]; then
    echo "Usage : ${0##*/}";
fi
IMAGE=roidsaa/ansible
VERSION=$(git rev-parse --short HEAD)
docker build \
    -t $IMAGE:latest \
    -t $IMAGE:$VERSION \
    ansible
