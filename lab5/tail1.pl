#!/usr/bin/perl -w

$print_last = 10;
$num_lines = 0;
$currLine = 1;

=begin comment 
if (@ARGV)

1. read in from stdin mode or files
2. read files into a list
3. print lines

=end comment
=cut 


#handling STDIN modet
if ($#ARGV+1 == 0){
	@list = <STDIN>;
	foreach $line (@list) {
		$num_lines++;
	}
	#print "number of lines is $num_lines";
	foreach $line (@list) {
		if ($num_lines - $currLine < $print_last){
			print $line;
		}
		$currLine++;
	}
	exit 0;

}else{
	#file mode
	foreach $arg (@ARGV) {
	   	#options
    	if ($arg =~ '^-[0-9]+'){
        	$print_last = $arg;
        	$print_last =~ s/-//;
		#files        
		}else{
        	push @files, $arg;
		}
	}

	#opening files	
	foreach $f (@files){
		if ($#ARGV+1 > 2){
			print "==> $f <==\n"
		}
		my $currLine = 1;
		open $f, '<', $f or die "$0: Cant open $f: $!\n";
		
		#find the num of lines
		@list = <$f>;	
		foreach $line (@list) {
			$num_lines++;
		}
		#print the last lines
		foreach $line (@list) {
			if ($num_lines - $currLine < $print_last){
				print $line;
			}
			$currLine++;
		}
		close $f;
	}
	exit 0;
}	
