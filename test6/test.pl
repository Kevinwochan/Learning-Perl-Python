#!/usr/bin/perl

while ($line = <STDIN>) {
	@matches = $line =~ m/[a-zA-Z]/;
	print @matches;
}
