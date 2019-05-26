package Gigasecond;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(add_gigasecond);

use Time::Piece;

sub add_gigasecond {
  ( Time::Piece->strptime( shift, '%Y-%m-%dT%T' ) + 10**9 )->datetime;
}

1;
