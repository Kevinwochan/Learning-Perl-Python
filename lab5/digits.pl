#!/usr/bin/perl

while ($line = <STDIN>){
	if (line == EOF){
		break;
	}
	$line =~ tr/012346789/<<<<<>>>>/;
	print "$line";
}
exit 0;
