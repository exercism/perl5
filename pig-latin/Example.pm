package Example;

use v5.10.1;
use strict;
use warnings;

sub translate {
    my $original = shift;
    my @pig_latin;

    foreach my $orig ( split /\s+/ => $original ) {
        given ($orig) {
            when (/^[aeiou]/)            { push @pig_latin => "${original}ay" }
            when (/^y[^aeiou]/)          { push @pig_latin => "${original}ay" }
            when (/^x[^aeiou]/)          { push @pig_latin => "${original}ay" }
            when (/^([^aeiou]*qu)(.+)/)  { push @pig_latin => "$2$1" . "ay"   }
            when (/^([^aeiou]+)(.+)/)    { push @pig_latin => "$2$1" . "ay"   }
        }
    }

    return join " " => @pig_latin;
}

__PACKAGE__;
