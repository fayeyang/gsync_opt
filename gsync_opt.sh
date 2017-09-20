#!/bin/bash

echo >tmp.log
echo >test.log

ROW=`wc -l < /home/faye/work/gsync_opt/gsync.log`
echo $ROW

while read CURRENTLINE ; do
    if [ "`echo "$CURRENTLINE" | grep "are named the same after normalization and lower-casing:"`" ] ; then
        filename=$( echo "$CURRENTLINE" | awk -v FS="'" '{ print $2; exit }' )
        filename_sed=$(echo $filename | sed 's/\//\\\//g')
        sed -n "/$filename_sed/Ip" /home/faye/work/gsync_opt/gsync.log >>tmp.log
        sed -i "/$filename_sed/Id" /home/faye/work/gsync_opt/gsync.log
        continue
    fi
    # echo "$CURRENTLINE" >>/home/faye/work/gsync_opt/test.log
done < /home/faye/work/gsync_opt/gsync.log

echo DONE

