package PhoneNumber 2;
use strict;
use warnings;

sub clean_number {
  my ($number) = @_;
  $number =~ s/\D//g;
  return $number =~ /^ 1? ( (?: [2-9] \d{2} ){2} \d{4} ) $/x ? $1 : undef;
}


1;
