package Example;

use strict;
use warnings;

sub keep { [ _filter(@_, 1) ] }
sub discard { [ _filter(@_, 0) ] }

sub _filter {
    my ($list, $function, $is_keeping) = @_;

    die "ArgumentError: 2nd parameter must be a function reference" unless ref $function eq 'CODE';

    my @result;

    foreach my $element (@$list) {
        if ($is_keeping) {
            push @result, $element if $function->($element);
            next;
        }
        # discard
        push @result, $element unless $function->($element);
    }

    return @result;
}

1;
