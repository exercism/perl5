package Yacht;

use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<score>;

use List::Util qw(uniq sum all);
use Yacht::Category;

my $dispatch = {
    $Yacht::Category::YACHT  => sub { scalar( uniq @_ ) == 1 ? 50 : 0; },
    $Yacht::Category::CHOICE => sub { sum @_; },
    $Yacht::Category::ONES   => sub { single( 1, @_ ); },
    $Yacht::Category::TWOS   => sub { single( 2, @_ ); },
    $Yacht::Category::THREES => sub { single( 3, @_ ); },
    $Yacht::Category::FOURS  => sub { single( 4, @_ ); },
    $Yacht::Category::FIVES  => sub { single( 5, @_ ); },
    $Yacht::Category::SIXES  => sub { single( 6, @_ ); },
    $Yacht::Category::FULL_HOUSE      => sub { full_house(@_); },
    $Yacht::Category::FOUR_OF_A_KIND  => sub { four_kind(@_); },
    $Yacht::Category::LITTLE_STRAIGHT => sub { straight( [ 1 .. 5 ], @_ ); },
    $Yacht::Category::BIG_STRAIGHT    => sub { straight( [ 2 .. 6 ], @_ ); },
};

sub score ( $dice, $category ) {
    return $dispatch->{$category}->( $dice->@* );
}

sub single ( $die, @dice ) {
    return $die * grep { $_ == $die } @dice;
}

sub full_house(@dice) {
    my @s = sort { $a <=> $b } @dice;
    return $s[0] != $s[4] && (
        ( $s[0] == $s[1] && $s[2] == $s[4] ) ||
        ( $s[0] == $s[2] && $s[3] == $s[4] )
        )
        ? sum(@dice)
        : 0;
}

sub four_kind(@dice) {
    my @s = sort { $a <=> $b } @dice;
    return ( $s[0] == $s[3] || $s[1] == $s[4] ) ? 4 * $s[2] : 0;
}

sub straight( $wanted, @dice ) {
    my @sorted = sort { $a <=> $b } @dice;
    return ( all { $sorted[$_] == $wanted->[$_] } 0 .. 4 ) ? 30 : 0;
}

1;
