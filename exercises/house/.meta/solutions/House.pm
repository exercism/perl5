package House;

use strict;
use warnings;

sub new {
    my $class = shift;
    return bless {}, $class;
}

sub recite {
    my $self = shift;
    my @rhyme;
    my @lines = (
        ['the house that Jack built.'],
        ['the malt', 'that lay in'],
        ['the rat', 'that ate'],
        ['the cat', 'that killed'],
        ['the dog', 'that worried'],
        ['the cow with the crumpled horn', 'that tossed'],
        ['the maiden all forlorn', 'that milked'],
        ['the man all tattered and torn', 'that kissed'],
        ['the priest all shaven and shorn', 'that married'],
        ['the rooster that crowed in the morn', 'that woke'],
        ['the farmer sowing his corn', 'that kept'],
        ['the horse and the hound and the horn', 'that belonged to'],
    );

    my @repeat;

    foreach my $i (0..$#lines) {
        my $block = "This is $lines[$i]->[0]\n";
        my $j     = $i - 1;
        my $that  = $lines[$i]->[1];

        while ($j >= 0) {
            $block .= "$that $repeat[$j]->[0]\n";
            $that   = $repeat[$j]->[1];
            $j--;
        }

        push @repeat, $lines[$i];
        push @rhyme,  $block;
    }

    return join "\n", @rhyme;
}

1;
