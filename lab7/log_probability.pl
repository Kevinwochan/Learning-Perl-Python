#!/usr/bin/perl -w
 $pattern = "$ARGV[0]";
 @files = glob("lyrics/*.txt");

foreach  $file (@files){
	$matches = 0;
	$wordcount = 0;
	open (F,'<', $file) or die;
	while($line = <F>){
	
	$wordcount += (@words) = $line =~ m/[a-zA-Z]+/g;
	foreach  $word (@words){
			if ($word =~ m/^$pattern$/i){
				$matches++;
			}
		}
	}
	
	$file =~ s/.txt//;
	$file =~ s/lyrics\///;
	$file =~ s/_/ /g;
	
	$matches++;
	$log = log($matches/$wordcount);
	printf "log((%d+1)/%6d) = %8.4f %s\n",$matches-1,$wordcount,$log,$file;
	close F;
}
