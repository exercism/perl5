package Clock;
use Moo;

# rwp = read-write protected
has hour   => ( is => 'rwp' );
has minute => ( is => 'rwp' );

sub time {
  my ($self) = @_;
  return undef;
}

sub add_minutes {
  my ( $self, $amount ) = @_;
  return undef;
}

sub subtract_minutes {
  my ( $self, $amount ) = @_;
  return undef;
}

1;
