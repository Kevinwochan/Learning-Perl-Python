#!/usr/bin/perl -w
 $pattern = "$ARGV[0]";
 @files = glob("lyrics/*.txt");

foreach  $file (@files){
	$count = 0;
	$wordcount = 0;
	open (F,'<', $file) or die;
	while($line = <F>){
	
	$wordcount += (@words) = $line =~ m/[a-zA-Z]+/g;
	foreach  $word (@words){
			if ($word =~ m/^$pattern$/i){
				$count++;
			}
		}
	}
	
	$file =~ s/.txt//;
	$file =~ s/lyrics\///;
	$file =~ s/_/ /g;
	
	if ($wordcount == 0){print "file is $file"};
	
	printf "%4d/ %6d = %.9f %s\n",$count,$wordcount,($count/$wordcount), $file;
	close F;
}
