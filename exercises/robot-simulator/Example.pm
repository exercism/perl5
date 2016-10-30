# there are 2 packages in this file; separate them once multiple files are supported

use strict;
use warnings;
use feature qw(switch);

{
    package Example;

    use constant        NORTH => 'north';
    use constant { WEST => 'west', EAST  => 'east' };
    use constant        SOUTH => 'south';

    sub new { bless {}, $_[0] }
    sub bearing { $_[0]->{bearing} }
    sub coordinates { $_[0]->{coordinates} }

    sub orient {
        my ($self, $direction) = @_;
        die "ArgumentError: invalid orientation: $direction" 
                unless grep { $_ eq $direction } (NORTH, SOUTH, EAST, WEST);
        $self->{bearing} = $direction; 
    }

    sub turn_right {
        my $self = shift;

        # clockwise
        given ( $self->{bearing} ) {
            when (/north/) { $self->orient(EAST) }
            when (/east/)  { $self->orient(SOUTH) }
            when (/south/) { $self->orient(WEST) }
            when (/west/)  { $self->orient(NORTH) }
        }
    }

    sub turn_left {
        my $self = shift;

        # counter-clockwise
        given ( $self->{bearing} ) {
            when (/north/) { $self->orient(WEST) }
            when (/west/)  { $self->orient(SOUTH) }
            when (/south/) { $self->orient(EAST) }
            when (/east/)  { $self->orient(NORTH) }
        }
    }

    sub at {
        my ($self, $x, $y) = @_;
        $self->{coordinates} = [$x, $y];
    }

    sub advance {
        my $self = shift;
        my ($x, $y) = (0, 1);

        given ( $self->{bearing} ) {
            when (/north/) { $self->{coordinates}->[$y]++ }
            when (/south/) { $self->{coordinates}->[$y]-- }
            when (/east/)  { $self->{coordinates}->[$x]++ }
            when (/west/)  { $self->{coordinates}->[$x]-- }
        }
    }

} # end of Package Example;

{
    package Simulator;

    sub new { bless {}, $_[0] }

    sub place {
        my ($self, $robot, $options) = @_;
        $robot->at($options->{x}, $options->{y});
        $robot->orient($options->{direction});
    }

    sub evaluate {
        my ($self, $robot, $abbreviation) = @_;
        my @instructions = @{ $self->instructions($abbreviation) };

        foreach my $inst ( @instructions ) {
            given ($inst) {
                when (/left/)    { $robot->turn_left }
                when (/right/)   { $robot->turn_right }
                when (/advance/) { $robot->advance }
            }
        }
    }

    sub instructions {
        my ($self, $abbreviation) = @_;
        my @instructions;
        
        foreach my $letter ( split //, $abbreviation) {
            given ($letter) {
                when (/L/) { push @instructions, "turn_left" }
                when (/R/) { push @instructions, "turn_right" }
                when (/A/) { push @instructions, "advance" }
            }
        }

        return \@instructions;
    }
}

1;
