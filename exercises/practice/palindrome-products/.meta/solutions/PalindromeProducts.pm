package PalindromeProducts;

use strict;
use warnings;
use feature      qw<say>;
use experimental qw<signatures postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<smallest_palindrome largest_palindrome>;

sub smallest_palindrome {
    my ( $min, $max ) = @_;
    die 'min must be <= max' if $min > $max;

    my %result = (
        factors => [],
        value   => undef,
    );

    for my $i ( $min .. $max ) {
        last if $result{value} && $result{value} < $i * $i;
        for my $j ( $i .. $max ) {
            my $prod = $i * $j;
            if ( $prod eq reverse $prod ) {
                if ( !defined $result{value} || $prod < $result{value} ) {
                    $result{value}   = $prod;
                    $result{factors} = [];
                }
                if ( $result{value} == $prod ) {
                    push @{ $result{factors} }, [ $i, $j ];
                }
            }
        }
    }

    return \%result;
}

sub largest_palindrome {
    my ( $min, $max ) = @_;
    die 'min must be <= max' if $min > $max;

    my %result = (
        factors => [],
        value   => undef,
    );

    for my $i ( reverse $min .. $max ) {
        last if $result{value} && $result{value} > $i * $i;
        for my $j ( reverse $min .. $i ) {
            my $prod = $i * $j;
            if ( $prod eq reverse $prod ) {
                if ( $prod > ( $result{value} // 0 ) ) {
                    $result{value}   = $prod;
                    $result{factors} = [];
                }
                if ( $result{value} == $prod ) {
                    push @{ $result{factors} }, [ $j, $i ];
                }
            }
        }
    }

    return \%result;
}

1;
