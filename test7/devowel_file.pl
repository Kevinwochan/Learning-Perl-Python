#!/usr/bin/perl -w
$file = '';
open ($F,'<', $ARGV[0]);
while ($line = <$F> ) {
	$line =~ s/[aeiouAEIOU]//g;
	$file = $file.$line;
}
close $F;

open ($F,'>',$ARGV[0]);
print $F "$file";
close $F;
