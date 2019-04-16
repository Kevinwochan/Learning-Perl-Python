#!/usr/bin/python
import sys
import re
wordCount = 0
for line in sys.stdin:
    extracted = re.findall('[a-zA-Z]+',line,flags=0)
    wordCount += len(extracted);
print wordCount," words"

