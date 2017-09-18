#!/bin/bash

ROW=`wc -l < /home/faye/work/gsync_opt/gsync.log`
echo $ROW

while read CURRENTLINE ; do
    if [ "`echo "$CURRENTLINE" | grep "are named the same after normalization and lower-casing:"`" ] ; then
        filename=$( echo "$CURRENTLINE" | awk -v FS="'" '{ print $2; exit }' )
        echo "$filename" >> tmp.log
        continue
    fi
    echo "$CURRENTLINE" >> /home/faye/work/gsync_opt/test.log
done < /home/faye/work/gsync_opt/gsync.log

