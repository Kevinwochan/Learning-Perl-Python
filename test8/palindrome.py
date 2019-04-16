#!/usr/bin/python3.6

import sys,re

word = sys.argv[1].lower()

word = re.sub("[^a-zA-Z]","",word)

letters = re.split("[a-zA-Z]",word)

for letter in range( 0,int( len(word)-1/2 ) ):

	letter2 = len(word)-letter-1

#	print ( word[letter2]+" :  "+ word[letter] )

	if word[letter2] != word[letter]:
		print ("False")
		sys.exit(0)


print ("True")
sys.exit(0)
		
