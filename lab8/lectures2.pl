#!/usr/bin/perl
use strict;
#so i can translate numbers into days of the week
my %weekday = (1, "Mon", 2, "Tue", 3, "Wed", 4, "Thu", 5, "Fri");
#stores the weekly timetable in $timetable{semeser}{dayoftheweekstring}{hour} 
#=num classes at that time
my %timetable = ();
my @semesters = ("false","false","false");

#intialises hashtable of how many classes there are
#at a certain hour to 0
foreach my $semester (1..2){
    $semester = "S$semester";
    #print "$semester       Mon   Tue   Wed   Thu   Fri\n";
    foreach my $hour (9..20){
        #printf ("%02d:00",$hour);
        foreach my $day (1..5){
            $day = "$weekday{$day}";
            $timetable{$semester}{$day}{$hour}{"classes"} = " ";
            #print"     $timetable{$semester}{$day}{classes}"
        }
        #print"\n";
    }
}
#print"#==TIMETABLE INTIALISED==\n";
#iterates thhrough all the courses passed as an argument
foreach my $course (@ARGV){
    #this hash checks for any repitions in capturing a lecture'
    #time string
	my %hash = ();
	my $url = "http://www.timetable.unsw.edu.au/current/";
	#stores the webpage in \n seperated array
	my @webpage = `wget -q -O- $url$course".html"`;
	my $lineCounter = 0;
	my $flag = 0;
	my $semester = 0;
	#iterates through the webpage line by line
	foreach my $line (@webpage){
	    #once the page starts referencing semester two
	    #change semester mode
		if ($line =~ m/SEMESTER TWO/){
			$semester = "S2";
			$semesters[2] = "true";
	   }elsif($line =~ m/SEMESTER ONE/){
			$semester = "S1";
			$semesters[1] = "true";
		}
		#count 6 lines down from >Lecture< 
		if ($line =~ m/>Lecture</){
			$flag = 1;
			$lineCounter  = 0;
		}
		#if we found the line with all the information
		if($lineCounter == 6 && $line =~ m/Weeks/){
		    #extract the good stuff
			$line =~ m/\>(.*)\</;
			my $time = $1;
			#lab part 1 and 2
			if ("$ARGV[0]" eq "-d"| "$ARGV[0]" eq "-t"){
				(my @days) = ($time =~ m/([a-zA-Z]{3}) (\d+):\d+ - (\d+):\d+ /g);
				#for every day thats been matched
				for (my $index=0;$index<scalar(@days);$index+=3){
					#save lecture hours into timetable
					for my $hour ($days[$index+1] .. $days[$index+2]-1){
						#remove duplicates, if that class has already been entered
						if(!exists$timetable{$semester}{$days[$index]}{$hour}{$course}){
							if( "$ARGV[0]" eq "-d"){
								print"$semester $course $days[$index] $hour\n";
							 }
							$timetable{$semester}{$days[$index]}{$hour}{$course} = 1;
							$timetable{$semester}{$days[$index]}{$hour}{"classes"}++;	
							#print"$semester $days[$index] $hour $course \n";
						}
					}
				}
			#lab part 0
			}elsif (!exists $hash{"$semester:$time"}){
				print"$course: $semester $time\n";
				$hash{"$semester:$time"} = 1;
			}
			$flag = 0;
			$lineCounter = 0;
		}
		$lineCounter++;
	}
}

if("$ARGV[0]" eq "-t"){
	 foreach my $semester (1..2){
		  if("$semesters[$semester]" eq "true" ){
			 $semester = "S$semester";
				print "$semester       Mon   Tue   Wed   Thu   Fri\n";
				foreach my $hour (9..20){
					 printf ("%02d:00",$hour);
					 foreach my $day (1..5){
						  $day = "$weekday{$day}";
						  print"     $timetable{$semester}{$day}{$hour}{classes}"
					 }
					 print"\n";
				}
		  }
	 }
}
