#!/usr/bin/python3
import sys
numbers = sys.argv
numbers[0] = 0
numbers.sort(key=int)
num_of_numbers = len(numbers)
median  = numbers[int(num_of_numbers/2)]
print (median)
