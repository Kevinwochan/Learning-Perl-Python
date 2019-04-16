#!/usr/bin/perl
$req = $ARGV[0];
%inputsHash;

while ($line = <STDIN>){
		$input{$line}++;
	if ( ! exists $inputHash{$line}){
		$inputHash{$line} = 1;
	}else{
		$inputHash{$line}++;
	}	
	if ($input{$line} == $ARGV[0]){
		print "Snap: $line";
		exit 0;
	}

}
