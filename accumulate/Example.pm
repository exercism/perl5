package Example;

use strict;
use warnings;

sub accumulate {
    my ($list, $function) = @_;
    my @accumulated = qw();
    foreach my $element ( @$list ) {
        push @accumulated => $function->($element);
    }
    
    return \@accumulated;
}

__PACKAGE__;
