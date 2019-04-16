#!/usr/bin/perl -w

use strict;
my @input = <STDIN>;

foreach my $line (@input){
	my @words = split/\s/,$line;
	my @sorted  = sort @words;
	foreach my $word (@sorted){
		print "$word ";
	}
	print"\n";
	
}
