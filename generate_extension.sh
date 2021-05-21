#! /bin/sh

set -xe

SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
cd $SCRIPT_PATH

# Sources compilation
cd src
gcc -lext2fs -o zerofree zerofree.c
cd ..

# TCZ extension generation
mv src/zerofree zerofree/usr/local/bin/zerofree
chmod -R 755 zerofree/*
sudo chown -R root:root zerofree/*
sudo mksquashfs zerofree zerofree.tcz
sudo chown -R tc zerofree/usr
printf "\nzerofree TCZ extension successfully created\n"