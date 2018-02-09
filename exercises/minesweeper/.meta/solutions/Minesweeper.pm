package Minesweeper;

use strict;
use warnings;

sub count_adjacent_bombs {
    my $board = shift;

    my @lines = split "\n", $board;

    # All input lines have same length
    my $length = length( $lines[0] );
    die "ArgumentError" if grep { length != $length } @lines;

    # The board consists of legal characters
    my @board = grep { /[-+| *]/ } map { split // } @lines;
    die "ArgumentError" if @board < @lines * $length;

    # The borders are sane
    /^\+\-+\+$/ or die "ArgumentError" for @lines[0, -1];
    /^\|.+\|$/  or die "ArgumentError" for @lines[1 .. -2];

    my $translate = sub { $_[0] * $length + $_[1] };

    my $count_bombs = sub {
        my($row, $col) = @_;

        $row -= 2;
        return grep { $board[$_] eq "*"              }
               map  { $translate->( @$_ )            } 
               map  { $row++; map { [$row, $_] } @$_ }
                      ( [$col-1, $col, $col+1] ) x 3;
    };

    foreach my $row ( 1 .. @lines-1 ) {
	foreach my $col ( 1 .. $length-1 ) {
	    my $idx = $translate->($row, $col);
	    next unless $board[$idx] eq " ";
	    $board[$idx] = $count_bombs->($row, $col) || " ";
	}
    }

    return( join "\n",
            map { join '', @board[$_ .. $_+$length-1] }
            map { $_ * $length } 0 .. @lines-1
	  ) . "\n";
}

1;

