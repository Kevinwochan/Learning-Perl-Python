#!/usr/bin/perl

$specific_whale = $ARGV[0];
$num_pods = 0;
$num_whales = 0;

while($line = <STDIN>){
	if ( $line =~ m/ \Q$specific_whale/ ){
		$num_pods++;
		$num_whales = $num_whales + $`;
	}
}
print "$specific_whale observations: $num_pods pods, $num_whales individuals\n";
