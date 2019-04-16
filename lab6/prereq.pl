#!/usr/bin/perl

sub printCourses{
	local $line = $_[0];
	if ($line =~ m/Prerequisite[s]*:/){
		($filter) = $line =~ m/(Prerequisite[s]*:.*?<)/g;
		@matches = ($filter =~ m/([A-Z]{4}[0-9]{4})/g);
		foreach $course_name (@matches) {
			$course_name =~ s/ /\\n/;
			print "$course_name\n";
		}
        
    }
}

$course = "$ARGV[0].html";
$UGurl = "http://www.handbook.unsw.edu.au/undergraduate/courses/current/";
$PGurl = "http://www.handbook.unsw.edu.au/postgraduate/courses/current/";

open F, "wget -q -O- $UGurl$course|";
	@filelines = <F>;
	foreach $line (@filelines) {
		printCourses($line);
	}
	close F;

open F, "wget -q -O- $PGurl$course|";
	@filelines = <F>;
	foreach $line (@filelines) {
		printCourses($line);
	}
	close F;

