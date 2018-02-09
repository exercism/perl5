package Matrix;

use strict;
use warnings;

sub new {
    my ($class, $matrix_str) = @_;
    my $self = bless {}, $class;
    my @rows = map { [split /\s/, $_] }  split /\n/, $matrix_str;

    foreach my $i ( 0..$#{$rows[0]} ) {
        my @row;
        foreach my $j ( 0..$#rows ) {
            push @row, $rows[$j]->[$i];
        }
        push @{$self->{columns}}, \@row;
    }
    $self->{rows} = \@rows;

    return $self;
}

sub rows {
    my ($self, $index) = @_;
    return $self->{rows}->[$index];
}

sub columns {
    my ($self, $index) = @_;
    return $self->{columns}->[$index];
}

sub saddle_points {
    my $self = shift;
    my @points;

    foreach my $i ( 0..$#{$self->{rows}} ) {
        foreach my $j ( 0..$#{$self->{rows}->[$i]} ) {

            my @row = @{ $self->{rows}->[$i] };
            my $current = splice @row, $j, 1;
            next if grep { $current < $_ } @row;

            my @column = @{ $self->columns($j) };
            splice @column, $i, 1;
            next if grep { $current > $_ } @column;

            push @points => [$i, $j];

        }
    }

    return \@points;
}

1;
