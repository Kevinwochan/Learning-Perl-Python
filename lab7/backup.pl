#!/usr/bin/perl -w
use strict;
#my $lyricFile = "$ARGV[0]";
# opens song.txt into the hash %song
my %song = ();
#open (S,'<',"$ARGV[0]") or die;
	while (my $songLine = <STDIN>){
    	my @songWords = $songLine =~ m/[a-zA-Z]+/g;
        foreach my $word (@songWords){
            if (exists $song{$word}){
                $song{$word}++;
            }else{
                $song{$word} = 1;
            }
        }
    }
#close S;
my %result = ();
#my @files = glob("lyrics/*.txt");
#foreach  my $file (@files){
    my $file = "lyrics/Adele.txt";
    my %fileMatches = ();
    my $wordcount = 0;
    open (F,'<', $file) or die;
    while(my $line = <F>){
        $wordcount += (my @words) = $line =~ m/[a-zA-Z]+/g;
        foreach  my $word (@words){
            if (exists $fileMatches{$word}){
                $fileMatches{$word}++;
            }else{
                $fileMatches{$word} = 1;
            }
        }
    }

    
    $file =~ s/.txt//;
    $file =~ s/lyrics\///;
    $file =~ s/_/ /g;
    my $artist = $file;

    my $logProb = 0;
    foreach  my $songWord (keys %song){
        if ( !exists $fileMatches{$songWord}){next; }
        my $frequency = $fileMatches{$songWord}+1/$wordcount;
        $logProb += log($frequency);
        printf "log((%d+1)/%6d) = %8.4f %s\n",$fileMatches{$songWord}-1,$wordcount,$logProb,$file;

    }
    
    $result{$artist} = $logProb;
 #   close F;
#}
