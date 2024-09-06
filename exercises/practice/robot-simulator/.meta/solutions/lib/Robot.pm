use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;
use Feature::Compat::Class;

class Robot;

field $x : reader param;
field $y : reader param;
field $direction : reader param;

method enact ($instructions) {
    for my $step ( split //, $instructions ) {
        if ( $step eq 'A' ) {
            if ( $direction eq 'north' ) {
                $y += 1;
            }
            elsif ( $direction eq 'south' ) {
                $y -= 1;
            }
            elsif ( $direction eq 'east' ) {
                $x += 1;
            }
            elsif ( $direction eq 'west' ) {
                $x -= 1;
            }
        }
        elsif ( $step eq 'L' ) {
            if ( $direction eq 'north' ) {
                $direction = 'west';
            }
            elsif ( $direction eq 'west' ) {
                $direction = 'south';
            }
            elsif ( $direction eq 'south' ) {
                $direction = 'east';
            }
            elsif ( $direction eq 'east' ) {
                $direction = 'north';
            }
        }
        elsif ( $step eq 'R' ) {
            if ( $direction eq 'north' ) {
                $direction = 'east';
            }
            elsif ( $direction eq 'east' ) {
                $direction = 'south';
            }
            elsif ( $direction eq 'south' ) {
                $direction = 'west';
            }
            elsif ( $direction eq 'west' ) {
                $direction = 'north';
            }
        }
    }

    return $self;
}

1;
