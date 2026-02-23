#!/bin/bash

WORKDIR=/workspace
CONTAINER_IMAGE=crops/poky:ubuntu-22.04

if [ $# -gt 1 ]; then
    exit 1
fi

if [ $# -eq 0 ]; then
    docker run -it -w $WORKDIR -v $PWD:$WORKDIR --rm $CONTAINER_IMAGE
    exit 0
fi

case "$1" in
    build)
        docker run -it -w $WORKDIR -v $PWD:$WORKDIR --rm $CONTAINER_IMAGE ./build.sh -n
        exit 0
        ;;
    *) 
        exit 1
        ;;
esac

exit 0