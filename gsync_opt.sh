#!/bin/bash

ROW=`wc -l < /home/faye/work/gsync/gsync.log`
echo $ROW
while read LINE ; do
    :
done < /home/faye/work/gsync/gsync.log



