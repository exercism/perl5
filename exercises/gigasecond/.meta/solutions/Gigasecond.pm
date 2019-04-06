package Gigasecond;

use strict;
use warnings;

use DateTime;

sub new {
  my ( $class, $year, $month, $day ) = @_;

  my $date = DateTime->new( year => $year, month => $month, day => $day );
  my $giga = DateTime::Duration->new( seconds => 1_000_000_000 );
  bless { date => $date->add_duration($giga) }, $class;
}

sub date {
  my ($self) = @_;
  return $self->{date}->truncate( to => 'day' );
}

1;
