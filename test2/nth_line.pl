#!/usr/bin/perl
$line  = $ARGV[0] - 1;

if (scalar(@ARGV) != 2){
	exit 1;
}

open (F,'<',$ARGV[1]) or die;

@list = <F>;

if($line > scalar(@list) || $line < 0){
	exit 1;
} 
	print "$list[$line]" ;

close F;
