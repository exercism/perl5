package Say;

use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<say_number>;

# Solution by GitHub Copilot
my @ones = qw(zero one two three four five six seven eight nine);
my @teens = qw(eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen);
my @tens = qw(ten twenty thirty forty fifty sixty seventy eighty ninety);

sub say_number ($num) {
    die "input out of range" if $num < 0 || $num >= 1e12;

    return $ones[$num]            if $num < 10;
    return $teens[ $num - 11 ]    if $num < 20;
    return $tens[ $num / 10 - 1 ] if $num < 100 && $num % 10 == 0;
    return $tens[ int( $num / 10 ) - 1 ] . "-" . $ones[ $num % 10 ] if $num < 100;
    return $ones[ int( $num / 100 ) ] . " hundred" if $num < 1000 && $num % 100 == 0;
    return $ones[ int( $num / 100 ) ] . " hundred " . say_number( $num % 100 ) if $num < 1000;
    return say_number( int( $num / 1000 ) ) . " thousand" if $num < 1e6 && $num % 1000 == 0;
    return say_number( int( $num / 1000 ) ) . " thousand " . say_number( $num % 1000 ) if $num < 1e6;
    return say_number( int( $num / 1e6 ) ) . " million" if $num < 1e9 && $num % 1e6 == 0;
    return say_number( int( $num / 1e6 ) ) . " million " . say_number( $num % 1e6 ) if $num < 1e9;
    return say_number( int( $num / 1e9 ) ) . " billion" if $num < 1e12 && $num % 1e9 == 0;
    return say_number( int( $num / 1e9 ) ) . " billion " . say_number( $num % 1e9 ) if $num < 1e12;
}

1;
