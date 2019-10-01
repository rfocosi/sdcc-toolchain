#!/bin/sh
docker build . -t sdcc-toolchain

VERSION=`docker run sdcc-toolchain sdcc -v | head -n 1 | awk '{ print $4 }'`

[ -z "$VERSION" ] && echo "ERROR: Version empty!" && exit 1

docker tag sdcc-toolchain rfocosi/sdcc-toolchain:$VERSION
docker push rfocosi/sdcc-toolchain:$VERSION
