package AoCUtils;

use strict;
use warnings;

use Exporter qw(import);
our @EXPORT_OK = qw(
	get_file_handler
);

sub get_file_handler {
	my @args = @_;
	my $FH;
	
	if (scalar @args > 1) {
        return 0;
    }
	elsif (scalar @args == 0) {
		open $FH, 'input' or die "Could not open 'input' file: $!";
	}
	else {
		my $alt_file = shift @args;
		open $FH, $alt_file or die "Could not open ${alt_file} file: $!";
	}
	
	return $FH;
}

1;
