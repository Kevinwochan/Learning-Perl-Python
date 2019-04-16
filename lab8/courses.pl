#!/usr/bin/perl -w
use strict;
my $course = $ARGV[0];
my $url = "http://www.timetable.unsw.edu.au/current/";
my $webpage = `wget -q -O- $url$course"KENS.html"`;
my (@courses) = $webpage =~ m/(${course}\d{4})/g;
my %hash = ();
foreach my $var (@courses){
	$hash{$var} = 1;
}
foreach my $key (sort keys %hash){
	print"$key\n";
}
