#!/usr/bin/perl
use warnings;
	$pattern = "$ARGV[0]";
	$count = 0;
while($line = <STDIN>){
	@words = split/[^a-zA-Z]+/, $line;
	foreach $word (@words){
		if ($word =~ m/^$pattern$/i){
			$count++;
		}
	}
}

print "$pattern occurred $count times \n";
