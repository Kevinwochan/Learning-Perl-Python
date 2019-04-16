#!/usr/bin/perl -w
use strict;
# opens song.txt into the hash %song
my @songs = @ARGV;
#iterates through every song
foreach my $file (@songs){
    my %song = ();
    open (S,'<',"$file") or die;
        #creates a hash using the songs Vocab->repitions
        while (my $songLine = <S>){
            my @songWords = lc($songLine) =~ m/[a-zA-Z]+/g;
            foreach my $word (@songWords){
                if (exists $song{$word}){
                    $song{$word}++;
                }else{
                    $song{$word} = 1;
                }
            }
        }
    close S;
    my @files = glob("lyrics/*.txt");
    my %results = ();
    foreach my $file (@files){
        my %matches = ();
        my $wordcount = 0;
        open (F,'<', $file) or die;
        while(my $line = <F>){
        
        $wordcount += (my @words) = lc($line) =~ m/[a-zA-Z]+/g;
        foreach  my $word (@words){
                if (exists $song{$word}){
                    $matches{$word}++;
                }else{
                    $matches{$word} = 1;
                }
            }
        }
        
        $file =~ s/.txt//;
        $file =~ s/lyrics\///;
        $file =~ s/_/ /g;
        my $logProb = 0;
        foreach my $word (keys %song){
            if (!exists $matches{$word}){$matches{$word} = 1;
            }else{ $matches{$word}++;}

            my $log = log($matches{$word}/$wordcount);
            $logProb+=$log*$song{$word};
        }
        $results{$file} = $logProb;
        close F;
}

    foreach my $artist (sort { $results{$b} <=> $results{$a}} keys %results){

        printf "%s most resembles the work of %s (log-probability=%.1f)\n", $file,$artist,$results{$artist};
        last;
    }
}
