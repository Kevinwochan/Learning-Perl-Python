#!/usr/bin/perl -w
use strict;
foreach my $course (@ARGV){
	my %hash = ();
	my %timetable = ();
	my $url = "http://www.timetable.unsw.edu.au/current/";
	my @webpage = `wget -q -O- $url$course".html"`;
	my $lineCounter = 0;
	my $flag = 0;
	my $semester = 0;
	foreach my $line (@webpage){
		if ($line =~ m/SEMESTER TWO/){
			$semester = 2;
		}elsif($line =~ m/SEMESTER ONE/){
			$semester = 1;
		}
		if ($line =~ m/>Lecture</){
			$flag = 1;
			$lineCounter  = 0;
		}
		if($lineCounter == 6 && $line =~ m/Weeks/){
			$line =~ m/\>(.*)\</;
			my $time = $1;
			if ("$ARGV[0]" eq "-d"){
				(my @matches) = ($time =~ m/([a-zA-Z]{3}) (\d+):00 - (\d+):00 /g);
				for (my $match=0;$match<scalar(@matches);$match+=3){
					for my $hour ($matches[$match+1] .. $matches[$match+2]-1){
							if (!exists $timetable{$semester}{$matches[$match]}{$hour}){
								print"S$semester $course $matches[$match] $hour\n";
								$timetable{$semester}{$matches[$match]}{$hour} = 1;
							}
					}
				}
			}elsif (!exists $hash{"$semester:$time"}){
				print"$course: S$semester $time\n";
				$hash{"$semester:$time"} = 1;
			}
			$flag = 0;
			$lineCounter = 0;
		}
		$lineCounter++;
	}
}
