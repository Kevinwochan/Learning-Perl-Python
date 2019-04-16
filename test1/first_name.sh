#!/bin/sh

cat "$1" | egrep 'COMP[29]041'| cut -d'|' -f3 | egrep -o ', [[:alpha:]]+'| tr -d ', '|sort |uniq -c |sort -nr | head -n'1' | tr -d '[0-9] '

