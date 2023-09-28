package OCRNumbers;

use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<convert_ocr>;

sub convert_ocr ($input) {

    my %digits = (
        ' _ | ||_|   ' => 0,
        '     |  |   ' => 1,
        ' _  _||_    ' => 2,
        ' _  _| _|   ' => 3,
        '   |_|  |   ' => 4,
        ' _ |_  _|   ' => 5,
        ' _ |_ |_|   ' => 6,
        ' _   |  |   ' => 7,
        ' _ |_||_|   ' => 8,
        ' _ |_| _|   ' => 9,
    );

    my @lines = split /\n/, $input;
    die "Number of input lines is not a multiple of four" if @lines % 4;
    my $width = length $lines[0];
    die "Number of input columns is not a multiple of three" if $width % 3;

    my @chars;
    for ( my $i = 0; $i < @lines; $i += 4 ) {
        push @chars, ',' if $i;
        for ( my $j = 0; $j < $width; $j += 3 ) {
            my $char = '';
            for ( my $k = 0; $k < 4; $k++ ) {
                $char .= substr( $lines[ $i + $k ], $j, 3 );
            }
            push @chars, $digits{$char} // '?';
        }
    }

    return join '', @chars;
}

1;
