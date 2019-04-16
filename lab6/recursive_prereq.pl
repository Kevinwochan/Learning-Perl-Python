#!/usr/bin/perl
use strict;
use warnings;

sub printCourses{
	my $line = $_[0];
	if ($line =~ m/Prerequisite[s]*:/){
		(my $filter) = $line =~ m/(Prerequisite[s]*:.*?<)/g;
		my @matches = ($filter =~ m/([A-Z]{4}[0-9]{4})/g);
		foreach $course_name (@matches) {
			my $course_name =~ s/ /\\n/;
			print "$course_name\n";
		}
    }
}

sub getURL{
	open my F1, "wget -q -O- $UGurl$_[0]|";
	open my F2, "wget -q -O- $PGurl$_[0]|";
	
	@filelines = (<F2>,<F1>);
	
	foreach my $line (@filelines) {
		if ($recurse == "true"){
			recursivePrint($line);
		}else{
			printCourses($line);
		}
	}
	
	close F1;
	close F2;
}

sub recursivePrint{
	my $line = $_[0];
	if ($line =~ m/Prerequisite[s]*:/){
		(my $filter) = $line =~ m/(Prerequisite[s]*:.*?<)/g;
		my @matches = ($filter =~ m/([A-Z]{4}[0-9]{4})/g);
		foreach my $course_name (@matches) {
			$course_name =~ s/ /\\n/;
			print "$course_name\n";
			getURL($course_name);
		}
     }
 
}
if ($ARGV[0] == "-r"){
	my $course = ARGV[1]
}else{
	my $course = "$ARGV[0].html";
}
$UGurl = "http://www.handbook.unsw.edu.au/undergraduate/courses/current/";
$PGurl = "http://www.handbook.unsw.edu.au/postgraduate/courses/current/";

	getURL:($course);

