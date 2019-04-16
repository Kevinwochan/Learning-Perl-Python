#!/bin/sh

egrep "COMP[29]041" "$1" | cut -d' ' -f2 | sort | uniq -c | sort -nr | head -n1 | sed 's/[ 0-9]*//g'
