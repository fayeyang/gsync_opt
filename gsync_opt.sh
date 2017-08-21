#!/bin/bash

ROW=`wc -l < gsync.log`
echo $ROW
ROW=0
while read LINE ; do
    echo $LINE
    ((ROW=ROW+1))
    if [ $ROW -eq 10 ]; then
        ls -al /proc/self/fd
        break
    fi
done < /home/faye/gsync.log

ls -al /proc/self/fd

#echo -e "`ps`"
#str=($(echo -e "`ps -o pid,comm`" | grep opt.sh))
#echo ${str[*]}

#fuser -um /home/faye/gsync.log



