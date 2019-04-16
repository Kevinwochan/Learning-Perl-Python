#!/usr/bin/perl -w
use strict;
foreach my $course (@ARGV){
    my %hash = ();

    my $url = "http://www.timetable.unsw.edu.au/current/";
    my @webpage = `wget -q -O- $url$course".html"`;
    # counts the lines below >Lecture<
    my $count = 0;
    #starts the counter to find the needed time
    my $flag = 0;
    #these store data about the course
    my @time = 0;
    my $semester = 0;
    
    foreach my $line (@webpage){
        if ($line =~ m/SEMESTER TWO/){
            $semester = 2;
        }elsif($line =~ m/SEMESTER ONE/){
            $semester = 1;
        }
        
        if ($flag == 1){
            $count++;
        }
        if ($line =~ m/>Lecture</){
            $flag = 1;
            $count  = 0;
        }
        if($count == 6){
            if($line =~ m/Weeks/){
                @time = $line =~ m/\>(.*)\</;
                if($ARGV[0] eq "-d" && !exists$hash{"$course: S$semester $time[0]"}){
                   (my $day, my $start) =  ($time[0] =~ m/^(\D{3}) (\d+):/);
                    print"S$semester $course $day $start\n";
                }elsif (!exists$hash{"$course: S$semester $time[0]"}){
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

