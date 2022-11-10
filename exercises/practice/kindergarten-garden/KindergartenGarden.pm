package KindergartenGarden;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<plants>;

sub plants {
    my ( $diagram, $student ) = @_;
    my %plants = (
        C => 'clover',
        G => 'grass',
        R => 'radishes',
        V => 'violets',
    );

    return undef;
}

1;
