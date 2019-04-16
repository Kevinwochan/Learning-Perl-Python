#!/bin/sh

newFile=`cat "$1" | sed s/[aeiouAEIOU]//g`
echo "$newFile" > "$1"
