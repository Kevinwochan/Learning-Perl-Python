#!/usr/bin/perl -w
use strict;
my %hash  = ();
my $countUnique = 0;
my $countLines = 0;
while (my $line  = <STDIN>){
	$countLines++;
	$line =~ s/\s//g;
	$line = lc($line);
	if (!exists $hash{$line}){
		$countUnique++;
	} 
	

	$hash{$line} = 1;
	if($countUnique == $ARGV[0]){
		print"$countUnique distinct lines seen after $countLines lines read.\n"; 
		exit 0;	
	}

}
print"End of input reached after $countLines lines read - $ARGV[0] different lines not seen.\n";	
