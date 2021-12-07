#!/usr/bin/perl

use strict;
use warnings;

use lib '../../../lib';
use AoCUtils qw(get_file_handler);

###
# Part One
###

my $fh = get_file_handler();

my $last_measurement = <$fh>;
my $number_increases = 0;

while (<$fh>) {
	if ($_ > $last_measurement) {		
		$number_increases++;
	}
	$last_measurement = $_;
}

print "Part One:\t$number_increases\n";

###
# Part Two
###

seek($fh, 0, 0);
chomp(my @measurements = <$fh>);
close $fh;

if ($#measurements < 3) {
	return 0;
}

my $sums = $measurements[0] + $measurements[1] + $measurements[2];
my $increases = 0;

for (my $i = 1; $i < $#measurements - 1; $i++) {
	my $temp = $measurements[$i] + $measurements[$i + 1]+ $measurements[$i + 2];
	if ($temp > $sums) {
		$increases++;
	}
	$sums = $temp;
}

print "Part Two:\t$increases\n";
