#!/bin/bash

ROW=`wc -l < gsync.log`
echo $ROW

exec 3<&0
exec 0<gsync.log

ROW=1
while read LINE ; do
    echo "$ROW $LINE"
    ((ROW=ROW+1))
    if [ $ROW -gt 10 ]; then
        break
    fi
done

exec 0<&3
exec 3<&-
ls -al /proc/self/fd




