#!/usr/bin/perl

use strict;
use warnings;
use feature qw(switch);

use lib '../../../lib';
use AoCUtils qw(get_array_from_file);

###
# Part One
###

my @lines = get_array_from_file('input');

my ($x_axis, $y_axis) = (0, 0);

foreach (@lines){
    my ($command, $depth) = split(/ /, $_);
    
    given ($command) {
		when ('forward') { $x_axis += $depth; }
		when ('down') { $y_axis += $depth; }
		when ('up') { $y_axis -= $depth; }		
	}
}

print "Part One:\t".($x_axis * $y_axis)."\n";

###
# Part Two
###

my $aim = 0;
$x_axis = $y_axis = $aim;

foreach (@lines){
    my ($command, $depth) = split(/ /, $_);
    
    given ($command) {
		when ('forward') {
			$x_axis += $depth;
			$y_axis += $aim * $depth;			
		}
		when ('down') { $aim += $depth; }
		when ('up') { $aim -= $depth; }		
	}
}

print "Part Two:\t".($x_axis * $y_axis)."\n";
