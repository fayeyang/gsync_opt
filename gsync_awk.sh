#! /bin/bash

ROW=`wc -l < /home/faye/work/gsync_opt/gsync.log`
echo $ROW

filename=$( awk -v FS="'" '/Two items on Left side are named the same after normalization and lower-casing:/{ print $2; exit }' /home/faye/work/gsync_opt/gsync.log )

echo $filename
