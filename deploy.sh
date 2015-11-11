#!/bin/bash

DATETIME=`date +"%Y%m%d-%H%M%S"`
MOUNT_DIR="sshfs-mount-webelement.sk-$DATETIME"

mkdir -p $MOUNT_DIR
sshfs webelement.sk@webelement.sk:/ $MOUNT_DIR

if [[ `mount | grep "webelement.sk@webelement.sk"` ]]; then
    echo "mounted"
    rm -rf $MOUNT_DIR/new
    cp -r _build $MOUNT_DIR/new
    mkdir -p $MOUNT_DIR/web
    mv $MOUNT_DIR/web $MOUNT_DIR/web-$DATETIME && mv $MOUNT_DIR/new $MOUNT_DIR/web
    ls -la $MOUNT_DIR
    fusermount -quz $MOUNT_DIR && rmdir $MOUNT_DIR
else
    echo "could not mount"
    exit 1
fi