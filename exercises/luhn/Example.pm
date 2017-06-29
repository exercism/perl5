package Luhn 2;
use strict;
use warnings;

sub is_luhn_valid {
  my ($input) = @_;
  $input =~ s/\s+//g;
  if (length $input < 2 || $input =~ /\D+/) {return 0}

  my @num = split(//, $input);
  unshift @num, 0 if scalar @num % 2;

  my $count = 1;
  my $sum = 0;

  foreach (@num) {
    if ($count % 2) {
      $sum += $_ * 2;
      $sum -= 9 if $_ * 2 > 9;
    }
    else {
      $sum += $_;
    }
    $count += 1;
  }

  if ($sum % 10) {return 0};
  return 1;
}

1;
