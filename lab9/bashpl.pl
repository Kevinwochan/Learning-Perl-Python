#!/usr/bin/perl
use strict;

foreach my $File (@ARGV){
	open(my $F,'<',$File) or die;
	
	foreach my $line (<$F>){
		chomp($line);
		my @spaces = $line =~ m/^(\s+)/;
		#doctype declarations
		if($line =~ m/#!\/bin\/bash/){
			print "#!/usr/bash/perl -w\n";
		#comments
		}elsif ($line =~ m/^\s*#/){
			print"$line\n";
		#while loops
		}elsif($line =~ m/while/){
	        $line =~ s/while \(\(//;
	        $line =~ s/\)\)$//;
	        my $condition;
            my @words = $line =~ m/(\w+) *([!=<>*%]+)*/g;
            foreach my $word (@words){
                if($word =~ m/[a-zA-Z]+/){
                    $word = "\$".$word;
                }else{
                    $word = " ".$word." ";
                }
                $condition = $condition."$word";
            } 

            print"$spaces[0]while \($condition\) {\n";
		#delete do dones
		}elsif($line =~ m/do$/){
		    
		}elsif($line =~ m/done$/){
		    $line =~ s/done/\}/;
		    print "$line\n";
	    #if statements
	    }elsif($line =~ m/^\s*if \(\(/){
	        $line =~ s/if \(\(//;
	        $line =~ s/\)\)$//;
	        my $condition;
            my @words = $line =~ m/(\w+) *([!=<>*%+]+)*/g;
            #print"@words words is \n";
            foreach my $word (@words){
                #print "$word word is\n";
                if($word =~ m/[a-zA-Z]+/){
                    $word = "\$".$word;
                }else{
                    $word = " ".$word." ";
                }
                $condition = $condition."$word";
            } 
            print"$spaces[0]if \($condition\) {\n";
        }elsif($line =~ m/else/){
            $line =~ s/else/\}else\{/;
            print"$line";
        }elsif($line =~ m/^then$/){
		    
		}elsif($line =~ m/fi$/){
		    $line =~ s/fi/\}/;
		    print "$line\n";
		#print statements
		}elsif($line =~ m/echo/){
		    $line =~ s/echo /print "/;
		    print "$line\\n\"\;\n";
		#arithmetic operations and intialisations
		}elsif($line =~ m/[=+-]+/){
            if ($line =~ s/\$\(\(//){
                $line =~ s/\)\)$//;
            }
            my %hash =();
            if (my @vars = $line =~ m/([a-zA-Z]+)/g){
                foreach my $var (@vars){
                    if(!exists $hash{$var}){
                        $line =~ s/$var/\$$var/g;
                        $hash{$var} = 1;
                    }
                }		        
	        }
            my @operators = $line =~ m/[=]/g;
            foreach my $operator (@operators){
                $line =~ s/$operator/ $operator /;
            }
            $line =~ s/\$\$/\$/g;
            print"$line\;\n";
		}else{
			#print"#not traslated line:";
			print"\n";
		}
	}
	close $F;
}
