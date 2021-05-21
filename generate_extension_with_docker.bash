#! /usr/bin/env bash

set -x

if [[ "$(docker images -q tinycore:12.0-x86_64 2> /dev/null)" == "" ]]; then
  echo "Local Docker image tinycore does not exist, we will build it with docker build..."
  docker build -t tinycore:12.0-x86_64 .
fi
docker run -it --rm \
  -v $(pwd):/tmp/zerofree \
  -w /tmp/zerofree tinycore:12.0-x86_64 sh ./generate_extension.sh