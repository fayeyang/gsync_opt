#!/bin/bash

#filename=/busybox/rfs-qt/opt/Qtopia/pics/keyboard/end.png
filename=end.png

filename_sed=$( echo $filename | sed 's/\//\\\//g' )

echo $filename
echo $filename_sed
