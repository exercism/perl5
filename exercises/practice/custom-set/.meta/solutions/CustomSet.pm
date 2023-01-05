package CustomSet;

use Moo;
use feature qw<say>;

use Types::Common qw<-types>;
use namespace::clean;

has elements => (
    is  => 'ro',
    isa => ( HashRef [Bool] )->plus_coercions(
        ArrayRef,
        sub {
            +{ map { $_ => 1 } @{ $_[0] } };
        },
    ),
    coerce => 1,
);

has _keys => (
    is      => 'lazy',
    builder => sub {
        [ keys %{ $_[0]->elements } ];
    },
);

sub is_empty {
    my ($self) = @_;
    return !@{ $self->_keys };
}

sub contains {
    my ( $self, $element ) = @_;
    return !!$self->elements->{$element};
}

sub is_subset_of {
    my ( $self, $set ) = @_;
    for my $key ( @{ $self->_keys } ) {
        return 0 unless $set->contains($key);
    }
    return 1;
}

sub is_disjoint_of {
    my ( $self, $set ) = @_;
    for my $key ( @{ $self->_keys } ) {
        return 0 if $set->contains($key);
    }
    return 1;
}

sub is_equal_to {
    my ( $self, $set ) = @_;
    return 0 if @{ $self->_keys } != @{ $set->_keys };
    for my $key ( @{ $self->_keys } ) {
        return 0 unless $set->contains($key);
    }
    return 1;
}

sub add {
    my ( $self, $element ) = @_;
    return __PACKAGE__->new( elements => [ @{ $self->_keys }, $element ] );
}

sub intersection {
    my ( $self, $set ) = @_;
    return __PACKAGE__->new(
        elements => [
            grep { $self->contains($_) && $set->contains($_) }
                @{ $self->_keys },
            @{ $set->_keys }
        ]
    );
}

sub difference {
    my ( $self, $set ) = @_;
    return __PACKAGE__->new(
        elements => [
            grep { $self->contains($_) && !$set->contains($_) }
                @{ $self->_keys },
            @{ $set->_keys }
        ]
    );
}

sub union {
    my ( $self, $set ) = @_;
    return __PACKAGE__->new(
        elements => [ @{ $self->_keys }, @{ $set->_keys } ] );
}

1;
