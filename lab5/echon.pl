#!/usr/bin/perl

if ( scalar(@ARGV) != 2 ){
	print "Usage: ./echon.pl <number of lines> <string>\n";
	exit 1;
}

if ( $ARGV[0] =~ /[A-z]+/ || $ARGV[0] < 0 ) {
	print "./echon.pl: argument 1 must be a non-negative integer\n";
	exit 1;
}else{
	foreach $i ( 1..$ARGV[0] ){
		print "$ARGV[1]\n";
	}
	exit 0;
}
 
