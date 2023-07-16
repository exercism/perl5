package Matrix;

use Moo;
use feature      qw<say>;
use experimental qw<signatures postderef postderef_qq>;

has string => (
    is => 'ro',
);

sub row {
    my ( $self, $index ) = @_;
    return [ split / /, [ split /\n/, $self->string ]->[ $index - 1 ] ];
}

sub column {
    my ( $self, $index ) = @_;
    return [ map { [ split / /, $_ ]->[ $index - 1 ] } split /\n/, $self->string ];
}

1;
