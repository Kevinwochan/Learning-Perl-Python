#!/usr/bin/perl -w
use strict;
foreach my $course (@ARGV){
		my %hash = ();

		my $url = "http://www.timetable.unsw.edu.au/current/";
		my @webpage = `wget -q -O- $url$course".html"`;
		my $count = 0;
		my $flag = 0;
		my @time = 0;
		my $semester = 0;
		foreach my $line (@webpage){
			if ($line =~ m/SEMESTER TWO/){
				$semester = 2;
			}elsif($line =~ m/SEMESTER ONE/){
				$semester = 1;
			}
			if ($line =~ m/>Lecture</){
				$flag = 1;
				$count  = 0;
			}
			if ($flag == 1){
				$count++;
			}
			if($count == 7){
				if($line =~ m/Weeks/){
					@time = $line =~ m/\>(.*)\</;
					if (!exists$hash{"$course: S$semester $time[0]"}){
						print"$course: S$semester $time[0]\n";
					}
					$hash{"$course: S$semester $time[0]"} = 1; 
					$flag = 0;
					$count = 0;
				}		
			}
		}

#	print "$url$course.html\n";
}

