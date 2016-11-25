package Example;

use strict;
use warnings;

my @gifts = (
    "Partridge in a Pear Tree",
    "Turtle Doves",
    "French Hens",
    "Calling Birds",
    "Gold Rings",
    "Geese-a-Laying",
    "Swans-a-Swimming",
    "Maids-a-Milking",
    "Ladies Dancing",
    "Lords-a-Leaping",
    "Pipers Piping",
    "Drummers Drumming",
);

my @days = qw(
    first second third fourth fifth
    sixth seventh eighth ninth tenth
    eleventh twelfth
);

sub new {
    bless {} => $_[0];
}

sub verse {
    my ($self, $i) = @_;
    $i--;
    my ($nth, $nth_gifts) = ( $days[$i], _slice_gifts($i) );

    "On the $nth day of Christmas my true love gave to me, $nth_gifts.\n";
}

sub verses {
    my ($self, $start, $end) = @_;
    my @verses;

    for ($start..$end) {
       push @verses => $self->verse($_); 
    }

    join ("\n" => @verses) . "\n";
}

sub sing { $_[0]->verses(1, 12) }

sub _slice_gifts {
    my $i = shift;
    my @slice;
    my @num = qw(
        two three four five six seven
        eight nine ten eleven twelve
    );

    unshift @num => do { $i > 0 ? "and a" : "a" };

    while ($i >= 0) {
       push @slice => ($num[$i] . " " . $gifts[$i]);
       $i--;
    }

    join ", " => @slice;
}

1;
