#!/usr/bin/perl
open($F,'<', $ARGV[0]) or die;
@lines = <$F>;
$numLines = scalar(@lines)-1;

$currLine = 0;
foreach $line (@lines){
    if($numLines/2 == $currLine){
        print"$line";
    }
    $currLine++;    
}

close $F;
