# This will be class 'RobotName', defined using Moo (https://perlmaven.com/oop-with-moo)
package RobotName;
use Moo;

# Declare a "name" attribute that is is 'rwp', read-write protected:
# read-only to consumers, but settable using $self->_set_name
has name => ( is => 'rwp' );

sub reset_name {
  my ($self) = @_;
  return undef;    # Replace this with your own code to pass the tests.
}

1;
