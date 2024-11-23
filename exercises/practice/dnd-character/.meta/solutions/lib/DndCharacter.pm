use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;
use Feature::Compat::Class;

class DndCharacter;

use POSIX qw<floor>;

sub modifier ( $class, $score ) {
    return floor( ( $score - 10 ) / 2 );
}

sub ability {
    my $d6  = sub { 1 + int( rand(6) ) };
    my $min = 6;
    my $sum = 0;
    for $_ ( 1 .. 4 ) {
        my $die = $d6->();
        $sum += $die;
        $min = $die if $min > $die;
    }
    return $sum - $min;
}

field $strength :reader;
field $dexterity :reader;
field $constitution :reader;
field $intelligence :reader;
field $wisdom :reader;
field $charisma :reader;
field $hitpoints :reader;

ADJUST {
    $strength     = __CLASS__->ability;
    $dexterity    = __CLASS__->ability;
    $constitution = __CLASS__->ability;
    $intelligence = __CLASS__->ability;
    $wisdom       = __CLASS__->ability;
    $charisma     = __CLASS__->ability;
    $hitpoints    = __CLASS__->modifier($constitution) + 10;
}

1;
