#!/bin/bash

FILES="disk-watch.service disk-watch.timer"
TARGET=/opt/disk-watch

mkdir -p $TARGET
cp run.sh /opt/disk-watch
cp $FILES /usr/lib/systemd/system/
for s in $FILES
do
	systemctl enable $s
done
