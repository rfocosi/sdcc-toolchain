#!/bin/sh
VERSION=$1

if [ -z "$VERSION" ]; then
  echo "Usage: `basename $0` <version>"
  exit 1
fi

docker build . -t sdcc-toolchain

SDCC_VERSION=`docker run sdcc-toolchain sdcc -v | head -n 1 | awk '{ print $4 }'`

[ -z "$SDCC_VERSION" ] && echo "ERROR: Version empty!" && exit 1

docker tag sdcc-toolchain rfocosi/sdcc-toolchain:$VERSION-SDCC-$SDCC_VERSION
docker push rfocosi/sdcc-toolchain:$VERSION-SDCC-$SDCC_VERSION
