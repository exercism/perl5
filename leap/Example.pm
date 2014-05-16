package Example;
use warnings;
use strict;

sub is_leap {
    my $year = shift;

    if ($year % 4 == 0
        and $year % 100 == 0
        and $year % 400 == 0)
    {
        return 1;
    }
    elsif ($year % 4 == 0
           and $year % 100 != 0)
    {
        return 1;
    }
    else {
        return 0;
    }
}

1;
