#!/usr/bin/perl -w
use strict;
my %hash = ();
foreach my $word (@ARGV){
	if(!exists $hash{$word}){
		print"$word ";
	}  
	$hash{$word} = 1;
}
print "\n";
