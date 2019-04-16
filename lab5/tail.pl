#!/usr/bin/perl -w

sub print_lines{
	my $linesInFile = scalar(@_);
	my $linesNotToPrint = $linesInFile - $tailSize;	
	my $currentLine = 1;
	foreach $line (@_) {
		if ($currentLine > $linesNotToPrint){
			print "$line";
		}
		$currentLine++;
	}
}

$tailSize = 10;

foreach $arg (@ARGV) {
    if ($arg =~ '-[0-9]+$') {
        $arg =~ s/^-//g;
		$tailSize = $arg;
    } else {
        push @files, $arg;
    }
}
if (scalar (@files) == 0){
	print_lines(<STDIN>);
	exit 0;
}
foreach $f (@files) {
	open $f, '<', $f or die "$0: Can't open $f: $!\n";
	if (scalar(@files) > 1){
		print "==> $f <==\n";
	}
	print_lines (<$f>); 
	close $f;
}
	exit 0;
