#! /bin/sh

SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
cd $SCRIPT_PATH
chmod -R 755 zerofree/*
chown -R 0:0 zerofree/*
mksquashfs zerofree zerofree.tcz -b 4k -no-xattrs
chown -R ${LOCAL_UID} zerofree/usr
printf "\nzerofree TCZ extension successfully created\n"