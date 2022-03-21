#! /usr/bin/env bash

set -x

SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
cd $SCRIPT_PATH

if [[ "$(docker images -q tinycore:12.0-x86_64 2> /dev/null)" == "" ]]; then
  echo "Local Docker image tinycore does not exist, we will build it with docker build..."
  cd TinyCore-toolchain
  make all
  docker build -t tinycore:12.0-x86_64 .
  cd ..
fi
mkdir -p out
chmod 777 out
docker run -it --rm \
  -v $(pwd):/tmp/zerofree -v $(pwd)/out:/out \
  -w /tmp/zerofree tinycore:12.0-x86_64 sh ./generate_extension.sh
