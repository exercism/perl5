package Example;
use warnings;
use strict;

sub new {
    my $class = shift;
    return bless {}, $class;
}

sub name {
    my $self = shift;
    return exists $self->{name} ? $self->{name} : $self->reset_name();
}

sub reset_name {
    my $self = shift;
    $self->{name} = _rand_letter() . _rand_letter() . _suffix();
    return $self->{name};
}

sub _rand_letter {
    my @letters = 'A'..'Z';
    return $letters[int rand $#letters];
}

sub _suffix {
    return 100 + int rand 900;
}

1;
