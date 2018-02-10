package Decimal;

use strict;
use warnings;

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

sub new {
    return bless {
       decimal => $_[1] 
    } => $_[0]
}

sub to_roman {
    my $self = shift;
    my $decimal = $self->{decimal};
    my $roman;
    my @places = sort {$b <=> $a} keys %ROMANS;

    use integer;

    while ( $decimal > 0 ) {
        my $key = shift @places;
        my $repeat = $decimal / $key;
        $decimal  -= $key * $repeat;
        $roman    .= $ROMANS{$key} x $repeat;
    }

    return $roman;
}

__PACKAGE__;
