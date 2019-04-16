#!/usr/bin/python3
import re,sys

file  = open (sys.argv[1],'r+')
newFile = ''
for line in file:
	newLine = re.sub("[aeiouAEIOU]",'',line)
	newFile = newFile + newLine
file.close ()

file  = open (sys.argv[1],'w')
file.write(newFile)	
file.close ()
