#!/usr/bin/perl
$largestNum = 0;
$largestLine  = 0;
$numbersFound = 0;

while($line = <STDIN>){
    if(@numbers = $line =~ m/-*?\d+\.*\d*/g){
        foreach $number (@numbers){
            if($number > $largestNum){
                $largestLine = $line;
                $largestNum = $number;
                $numbersFound++;
            }elsif($number == $largestNum){
                $largestLine = $largestLine . $line;
            }
        }
    }
}

if($numbersFound != 0){
    print"$largestLine";
}
