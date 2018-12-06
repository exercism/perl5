package Scrabble;
use strict;
use warnings;
use experimental 'signatures';
use List::Util qw(sum0);
use Exporter 'import';
our @EXPORT_OK = qw(score);

sub points ($points, @letters) {
    map { $_ => $points } @letters;
}

my %scores = (
    points(1, qw(A E I O U L N R S T)),
    points(2, qw(D G)),
    points(3, qw(B C M P)),
    points(4, qw(F H V W Y)),
    points(5, qw(K)),
    points(8, qw(J X)),
    points(10, qw(Q Z)),
);

sub score ($word, %extensions) {
    return sum0 map {
        $scores{uc $_} * 2 ** ($extensions{double} // 0)
                       * 3 ** ($extensions{triple} // 0)
    } $word =~ m/([A-Z])/ig;
}

1;
