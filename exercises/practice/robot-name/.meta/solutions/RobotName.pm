# This will be class 'RobotName', defined using Moo (https://perlmaven.com/oop-with-moo)
package RobotName;

use Moo; use feature qw<say>; # Use the `say` function to output debugging info in the online editor.
use experimental qw<signatures postderef postderef_qq>;

# Declare a "name" attribute that is is 'rwp', read-write protected:
# read-only to consumers, but settable using $self->_set_name
has name => ( is => 'rwp' );

sub BUILD {
    my ($self) = @_;
    $self->reset_name;
}

sub reset_name {
    my ($self) = @_;
    $self->_set_name( _rand_letter() . _rand_letter() . _suffix() );
    return $self->name;
}

sub _rand_letter {
    my @letters = 'A' .. 'Z';
    return $letters[ int rand $#letters ];
}

sub _suffix {
    return sprintf( '%03d', int rand 1000 );
}

1;
