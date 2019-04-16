#!/usr/bin/python3

import sys
import re

diction = {}
for i in range( 1,len(sys.argv)):
	word = sys.argv[i]
	if not word in diction:
		diction[word] = 1
		print (word,end=' ')

print()
