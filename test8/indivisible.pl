#!/usr/bin/perl -w
use strict;

my @numbers = [];

# iterate over STDIN lines
while (my $line = <STDIN>) {
	# extract numbers from the line
	my @extracted_numbers = ($line =~ m/[0-9]+/g);
	push @numbers,@extracted_numbers;
}

my @indivisible = [];

# iterate over numbers 
foreach ( @numbers ) {
	my $number1 = pop @numbers;

	foreach my $number2 ( @numbers ) {

		if ($number1 % $number2!=0 && $number1!=$number2 ){

			push @indivisible,$number2;
		}
	}
}

@indivisible = sort @indivisible;
print join(" ",@indivisible);

