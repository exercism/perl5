package Example;

use strict;
use warnings;

sub new {
    my ($class, $min_max) = @_;
    my $self = {};
    $self->{max_factor} = $min_max->{max_factor};
    $self->{min_factor} = $min_max->{min_factor} || 1;
    return bless $self, $class;
}

sub largest {
    my $self = shift;
    return $self->_filter_factors( sub { $_[0] > $_[1] } );
}

sub smallest {
    my $self = shift;
    return $self->_filter_factors( sub { $_[0] < $_[1] } );
}

sub _filter_factors {
    my ($self, $filter) = @_;
    my @all_factors = @{ _palindrome_factors( $self->{min_factor}, $self->{max_factor} ) };
    my @factors = (shift @all_factors);
    my $extreme_value = $factors[0]->[0] * $factors[0]->[1];

    foreach my $f ( @all_factors ) {
        my $value = $f->[0] * $f->[1];

        if ($filter->($value, $extreme_value)) {
            @factors = ($f,);
            $extreme_value = $value;
            next;
        }
        push @factors, [$f->[0], $f->[1]] if $value == $extreme_value;
    }

    return { value => $extreme_value, factors => \@factors };
}

sub _palindrome_factors {
    my ($min, $max) = @_;
    my $jmin = $min;
    $max = $max;
    my @factors;
    
    foreach my $i ( $min..$max ) {
        foreach my $j ( $jmin..$max ) {
            my $value = $i * $j;
            push @factors, [$i, $j] if _is_palindrome($value);
        }
        $jmin++;
    }

    return [@factors];
}

sub _is_palindrome {
    my $input = shift;
    return $input eq scalar(reverse $input);
}

1;
