package TwoBucket;

use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<measure>;

use List::Util qw(max min);

sub gcd ( $a, $b ) {
    while ( $b > 0 ) {
        ( $a, $b ) = ( $b, $a % $b );
    }
    return $a;
}

sub validate ( $b1, $b2, $goal ) {
    die 'impossible: goal too big' if $goal > max( $b1, $b2 );
    my $g = gcd $b1, $b2;
    die 'impossible: goal unsatisfiable' if $g > 1 && $goal % $g != 0;
}

sub fill     ($bucket) { $bucket->{amount} = $bucket->{size}; }
sub empty    ($bucket) { $bucket->{amount} = 0; }
sub is_full  ($bucket) { $bucket->{amount} == $bucket->{size}; }
sub is_empty ($bucket) { $bucket->{amount} == 0; }

sub pour (%buckets) {
    my $quantity = min $buckets{from}{amount}, ( $buckets{into}{size} - $buckets{into}{amount} );
    $buckets{from}{amount} -= $quantity;
    $buckets{into}{amount} += $quantity;
}

sub result ( $winner, $loser, $moves ) {
    return {
        moves       => $moves,
        goalBucket  => $winner->{name},
        otherBucket => $loser->{amount},
    };
}

sub measure ( $bucketOne, $bucketTwo, $goal, $startBucket ) {
    validate $bucketOne, $bucketTwo, $goal;

    my $first  = { name => 'one', size => $bucketOne, amount => 0 };
    my $second = { name => 'two', size => $bucketTwo, amount => 0 };
    ( $first, $second ) = ( $second, $first ) if $startBucket eq 'two';

    my $moves = 0;
    fill $first;
    $moves++;

    if ( $second->{size} == $goal && $first->{size} != $goal ) {
        fill $second;
        $moves++;
    }

    while (1) {
        return result( $first, $second, $moves ) if $first->{amount} == $goal;
        return result( $second, $first, $moves ) if $second->{amount} == $goal;

        if    ( is_empty $first ) { fill $first; }
        elsif ( is_full $second ) { empty $second; }
        else                      { pour from => $first, into => $second; }
        $moves++;
    }
}

1;