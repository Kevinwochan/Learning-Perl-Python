#!/usr/bin/perl
use warnings;
while($line = <STDIN>){
	$count += (@matches) = $line =~ m/[a-zA-Z]+/g;	
	$matched = scalar(@matches);
}
print "$count $matched words\n";
