package Meetup;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(meetup);

use Time::Piece;
use Time::Seconds;

use constant WEEKS => {
  first  => 1,
  second => 8,
  teenth => 13,
  third  => 15,
  fourth => 22,
};

sub meetup {
  my ($input) = @_;
  my $t = Time::Piece->strptime(
    join( '-',
      @{$input}{qw(year month)},
      WEEKS->{ $input->{week} } // 1 ),
    '%Y-%m-%d'
  );

  $t = $t->add_months(1) - ONE_WEEK if $input->{week} eq 'last';
  $t += ONE_DAY until $t->fullday eq $input->{dayofweek};
  return $t->ymd;
}

1;
