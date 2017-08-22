#!/bin/bash

ROW=`wc -l < /home/faye/work/gsync/gsync.log`
echo $ROW
while read LINE ; do

    if [ "`echo "$LINE" | grep "are named the same after normalization and lower-casing:"`" ] ; then
        continue
    fi
    echo "$LINE" >> /home/faye/work/gsync/test1.log

done < /home/faye/work/gsync/gsync.log


