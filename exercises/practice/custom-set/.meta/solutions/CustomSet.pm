package CustomSet;

use Moo;
use feature qw<say>;

has elements => (
    is     => 'ro',
    coerce => sub {
        if ( ref $_[0] eq 'ARRAY' ) {
            return { map { $_ => 1 } @{ $_[0] } };
        }
    },
);

sub is_empty {
    my ($self) = @_;
    return !keys %{ $self->elements };
}

sub contains {
    my ( $self, $element ) = @_;
    return $self->elements->{$element} // 0;
}

sub is_subset_of {
    my ( $self, $set ) = @_;
    for my $key ( keys %{ $self->elements } ) {
        return 0 unless $set->contains($key);
    }
    return 1;
}

sub is_disjoint_of {
    my ( $self, $set ) = @_;
    for my $key ( keys %{ $self->elements } ) {
        return 0 if $set->contains($key);
    }
    return 1;
}

sub is_equal_to {
    my ( $self, $set ) = @_;
    return 0 if keys %{ $self->elements } != keys %{ $set->elements };
    for my $key ( keys %{ $self->elements } ) {
        return 0 unless $set->contains($key);
    }
    return 1;
}

sub add {
    my ( $self, $element ) = @_;
    return __PACKAGE__->new(
        elements => [ keys %{ $self->elements }, $element ] );
}

sub intersection {
    my ( $self, $set ) = @_;
    return __PACKAGE__->new(
        elements => [
            grep { $self->elements->{$_} && $set->elements->{$_} }
                keys %{ $self->elements },
            keys %{ $set->elements }
        ]
    );
}

sub difference {
    my ( $self, $set ) = @_;
    return __PACKAGE__->new(
        elements => [
            grep { $self->elements->{$_} && !$set->elements->{$_} }
                keys %{ $self->elements },
            keys %{ $set->elements }
        ]
    );
}

sub union {
    my ( $self, $set ) = @_;
    return __PACKAGE__->new(
        elements => [ keys %{ $self->elements }, keys %{ $set->elements } ] );
}

1;
