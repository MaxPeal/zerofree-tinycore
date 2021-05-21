# ZeroFree TinyCore

This repository aims at creating and maintaining a TinyCore extension that provides the zerofree
executable (very useful when manipulating disk/partition images).

## TinyCore Docker image
To properly compile zerofree for TinyCore (with proper headers and libraries), you need to compile the TinyCore docker image using the Makefile in tinycore_src folder.
In order to do that, you need to have Docker and Make installed on your system. Then, you can just type `cd tinycore_src` and `make all`.

You can customize the TinyCore version with the TC_VERSION variable, to be passed as a build argument to Docker compilations.

## Zerofree extension creation
Run the script `generate_extension_with_docker.bash` to launch extension creation (source compilation + TCZ extension creation)

## Evolutions
We are planning to provide ARM support using the buildx functionality of Docker.