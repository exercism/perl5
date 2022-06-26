# there are 2 packages in this file; separate them once multiple files are supported

use strict;
use warnings;

{

    package Robot;

    sub new {
        return undef;
    }

    sub bearing {
        return undef;
    }

    sub coordinates {
        return undef;
    }

    sub orient {
        my ( $self, $direction ) = @_;

        return undef;
    }

    sub turn_right {
        my $self = shift;

        return undef;
    }

    sub turn_left {
        my $self = shift;

        return undef;
    }

    sub at {
        my ( $self, $x, $y ) = @_;

        return undef;
    }

    sub advance {
        my $self = shift;

        return undef;
    }

}    # end of Package Example;

{

    package Simulator;

    sub new {
        return undef;
    }

    sub place {
        my ( $self, $robot, $options ) = @_;

        return undef;
    }

    sub evaluate {
        my ( $self, $robot, $abbreviation ) = @_;

        return undef;
    }

    sub instructions {
        my ( $self, $abbreviation ) = @_;

        return undef;
    }
}

1;
