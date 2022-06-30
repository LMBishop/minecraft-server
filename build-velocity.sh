#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 [version]"
    exit 1
fi

docker build --no-cache --build-arg version=$1 -t minecraft-velocity-server:$1 scripts/velocity
