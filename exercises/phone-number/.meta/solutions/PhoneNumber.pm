package PhoneNumber;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(clean_number);

sub clean_number {
  my ($number) = @_;
  $number =~ s/\D//g;
  return $number =~ /^ 1? ( (?: [2-9] \d{2} ){2} \d{4} ) $/x ? $1 : undef;
}


1;
