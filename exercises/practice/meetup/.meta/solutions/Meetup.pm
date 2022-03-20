package Meetup;
use strict;
use warnings;
use Exporter qw<import>;
our @EXPORT_OK = qw<meetup>;

use Time::Piece;
use Time::Seconds;

use constant WEEKS => {
  First  => 1,
  Second => 8,
  Teenth => 13,
  Third  => 15,
  Fourth => 22,
};

sub meetup {
  my ($desc) = @_;
  $desc =~ /^(\w+) (\w+) of (\w+) (\d+)$/;

  my $t = Time::Piece->strptime( ( WEEKS->{$1} // 1 ) . " $3 $4",
    '%d %B %Y' );

  if ( $1 eq 'Last' ) {
    $t = $t->add_months(1) - ONE_WEEK;
  }

  until ( $t->fullday eq $2 ) {
    $t += ONE_DAY;
  }

  return $t->ymd;
}

1;
