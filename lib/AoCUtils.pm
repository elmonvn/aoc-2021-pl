package AoCUtils;

use strict;
use warnings;

use Exporter qw(import);
our @EXPORT_OK = qw(
    get_file_handler
    get_array_from_file
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

sub get_array_from_file {
    my @args = @_;

    return 0 if (scalar @args != 1);

    my $FH = get_file_handler(shift(@args));

    chomp(my @lines = <$FH>);
    close $FH;

    return @lines;
}

1;
