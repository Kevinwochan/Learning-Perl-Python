#!/usr/bin/perl -w

use strict;

foreach my $line (<STDIN>) {

	my @words = split(" ",$line);
	
	foreach my $word (@words) {
		my $isEqui = 1;

		$word =~ m/(.)/g;

		my $firstLetter = lc($1);
		my @firstLetters = $word =~ m/$firstLetter/ig;
		my $firstLetterCount = scalar(@firstLetters)+1; 

		#print "word $word: letter $firstLetter : count $firstLetterCount\n";	

		my @letters = $word =~ m/./g;
	
		my %uniqueLetters = ();

		foreach my $letter (@letters) {
			$letter = lc($letter);
			if ( ! exists $uniqueLetters{$letter} ) {
				$uniqueLetters{$letter} = 0;
			}
			$uniqueLetters{$letter}++;
		}
		
		foreach my $letter (keys %uniqueLetters) {
			if ($uniqueLetters{$letter} != $firstLetterCount){
				$isEqui = 0;
				last;
			}
		}	
		if ( $isEqui == 1 ) { print"$word ";
		}	

	}
	print "\n";

}
