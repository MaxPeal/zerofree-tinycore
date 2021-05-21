#! /usr/bin/env bash

if [[ "$(docker images -q extension-compiler 2> /dev/null)" == "" ]]; then
  echo "Docker image image-compiler does not exist, we will build it with docker build..."
  docker build -t extension-compiler .
fi
docker run -it -e "LOCAL_UID=$LOCAL_UID" --rm -v $(pwd):/code -w /code extension-compiler ./generate_extension.sh