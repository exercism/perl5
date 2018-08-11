package RomanNumerals;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(to_roman);

my %ROMANS = qw(
    1000 M
     900 CM
     500 D 
     400 CD 
     100 C 
      90 XC 
      50 L 
      40 XL 
      10 X 
       9 IX 
       5 V 
       4 IV 
       1 I 
);

sub to_roman {
    my ($number) = @_;
    my $roman;
    my @places = sort {$b <=> $a} keys %ROMANS;

    use integer;

    while ( $number > 0 ) {
        my $key = shift @places;
        my $repeat = $number / $key;
        $number  -= $key * $repeat;
        $roman   .= $ROMANS{$key} x $repeat;
    }

    return $roman;
}

1;
