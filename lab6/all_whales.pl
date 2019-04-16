#!/usr/bin/perl 
use strict;
use warnings;

my %indivs;
my %pods;
my $num_whales;
my $whale_name;

while(my $line = <STDIN>){
	chomp $line;
	($num_whales, $whale_name) = ($line =~ m/(\d*)\s*(\D*)/g);
	
	$whale_name = lc $whale_name;
	$whale_name =~ s/s?\s*$//g;
	$whale_name =~ s/\s+/ /g;
	
	if ( ! exists $indivs{$whale_name}){
		$indivs{$whale_name} = $num_whales;
		$pods{$whale_name} = 1;
	}else{
		$indivs{$whale_name} += $num_whales;
		$pods{$whale_name}++;

	}
}

foreach my $key (sort keys %pods){
print "$key observations: $pods{$key} pods, $indivs{$key} individuals\n";
}
