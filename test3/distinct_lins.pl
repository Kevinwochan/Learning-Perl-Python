#!/usr/bin/perl -w
use strict;
my %hash  = ();
my $countUnique = 0;
my $countLines = 0;
while (my $line  = <STDIN>){
	$line =~ s/\s//g;
	$line = lc($line);
	$hash{$line} = 1;

	if (!exists $hash{$line}){
		$countUnique++;
	} 
	
	if($countUnique == $ARGV[0]){
		last; 
	}
	$countLines++;
}

print"$countUnique distinct lines seen after $countLines lines read.";
