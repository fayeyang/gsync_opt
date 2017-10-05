#!/bin/bash

echo >tmp.log

ROW=`wc -l < gsync.log`
echo ROW=$ROW

sed -i "/<>/d" gsync.log
ROW=`wc -l < gsync.log`
echo "after modify: $ROW"

ROW=1
while read CURRENTLINE ; do
	printf "current line is: %s\r" $ROW
	((ROW=ROW+1))
    if [ "`echo "$CURRENTLINE" | grep "are named the same after normalization and lower-casing:"`" ] ; then
        filename=$( echo "$CURRENTLINE" | awk -v FS="'" '{ print $2; exit }' )
        filename_sed=$(echo $filename | sed 's/\//\\\//g')
        sed -n "/$filename_sed/Ip" gsync.log >>tmp.log
        sed -i "/$filename_sed/Id" gsync.log
        continue
    fi
done < gsync.log
echo
echo DONE
