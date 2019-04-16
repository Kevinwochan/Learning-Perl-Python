#!/usr/bin/perl

#use strict;

$numbers = ();
@numbers = @ARGV;
@numbers = sort { $a <=> $b } @numbers;
$num_numbers = scalar(@numbers);
$median  = $numbers[$num_numbers/2];
print "$median\n";
