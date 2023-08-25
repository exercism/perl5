package Darts;

use Moo;
use experimental qw<signatures postderef postderef_qq>;

has [qw< x y >] => (
    is => 'ro',
);

sub score ($self) {
    my $sqrt = sqrt $self->x**2 + $self->y**2;

    return 10 if $sqrt <= 1;
    return 5  if $sqrt <= 5;
    return 1  if $sqrt <= 10;
    return 0;
}

1;
