#! /bin/sh

set -xe

SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
cd $SCRIPT_PATH

# Sources compilation
TMPDIR=$(mktemp -d)
cd $TMPDIR
cp $SCRIPT_PATH/src/* .
#gcc -lext2fs -o zerofree zerofree.c
make all
cd ..

# TCZ extension generation
TMPDIR2=$(mktemp -d)
mkdir -p $TMPDIR2/zerofree/usr/local/bin
mv $TMPDIR/zerofree $TMPDIR2/zerofree/usr/local/bin/zerofree
chmod -R 755 $TMPDIR2/zerofree/*
sudo chown -R root:root $TMPDIR2/zerofree/*
cd $TMPDIR2/ && sudo mksquashfs zerofree zerofree.tcz -noappend
sudo chown -R tc $TMPDIR2/zerofree/usr
cp -R $TMPDIR2/ /out/
chmod -R 777 /out
printf "\nzerofree TCZ extension successfully created\n"
