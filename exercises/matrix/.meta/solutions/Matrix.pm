package Matrix;

use strict;
use warnings;

sub new {
    my ($class, $matrix) = @_;
    my $self =  bless {} => $class;
    foreach my $row (split '\n' => $matrix) {
        push @{$self->{rows}}, [ split '\s' => $row ];
    }
    return $self;
}

sub rows { $_[0]->{rows}->[$_[1]] }

sub columns { 
    my ($self, $index) = @_;
    my @column;
    
    push @column => $_->[$index] for @{$self->{rows}};

    return \@column;
}

1;

