#!/usr/bin/python3

import sys
import re
import warnings

for line in sys.stdin.readlines():
    # remove trailing new line
    line = line.strip()
    # split the line into a list of words
    words = line.split(' ')

    # iterate through the words
    for word in words:
        # if equi = 1, print the workd
        is_equi = 1
        # store every letter into key value table
        unique_letters = {}
        # seperate word into a list of lowercase letters	
        letters = list ( word.lower() )
        # first letter will be used as the comparison
        first_letter = letters[0]
       
        # count appearances of each letter 
        for letter in letters:
            if letter in unique_letters:
                unique_letters[letter]+=1
            else:
                unique_letters[letter] = 1

        # compare appearances of other letters with the first
        first_letter_count = unique_letters[first_letter]
        for letter in unique_letters:
            if unique_letters[letter] != first_letter_count:
                is_equi = 0

        if is_equi == 1:
            print (word,end=' ') 

    print ()
