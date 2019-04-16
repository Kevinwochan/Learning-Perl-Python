#!/usr/bin/perl -w

@input = <>;

my $inputSize = scalar(@input);
my @output = (0) x @input;

foreach $line (@input){
	my $newIndex = rand($inputSize);
	while ($output[$newIndex]){
		$newIndex++;
		$newIndex = $newIndex % $inputSize;
	}
	$output[$newIndex] = $line;
}

print "@output"; 
exit 0;
