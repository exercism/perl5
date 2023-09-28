package Allergies;

use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<allergic_to list_allergies>;

use constant ALLERGENS => {
    eggs         => 1,
    peanuts      => 2,
    shellfish    => 4,
    strawberries => 8,
    tomatoes     => 16,
    chocolate    => 32,
    pollen       => 64,
    cats         => 128,
};

sub allergic_to ( $item, $score ) {
    ALLERGENS->{$item} & $score;
}

sub list_allergies ($score) {
    return [ grep { allergic_to $_, $score }
            keys %{ +ALLERGENS } ];
}

1;
