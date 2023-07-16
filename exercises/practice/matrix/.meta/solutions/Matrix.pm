package Matrix;

use Moo;
use experimental qw<signatures postderef postderef_qq>;

has string => (
    is => 'ro',
);

sub row ( $self, $index ) {
    return [ split / /, [ split /\n/, $self->string ]->[ $index - 1 ] ];
}

sub column ( $self, $index ) {
    return [ map { [ split / /, $_ ]->[ $index - 1 ] } split /\n/, $self->string ];
}

1;
