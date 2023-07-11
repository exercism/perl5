package PhoneNumber;

use strict;
use warnings;
use feature      qw<say>;
use experimental qw<signatures postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<clean_number>;

sub clean_number {
    my ($number) = @_;
    $number =~ s/[()-. ]//g;
    if ( $number =~ /^ 1? (\d{10}) $/x ) {
        for (
            [ area     => substr( $1, 0, 1 ) ],
            [ exchange => substr( $1, 3, 1 ) ]
            )
        {
            die $_->[0]
                . ' code cannot start with '
                . ( $_->[1] ? 'one' : 'zero' )
                if $_->[1] < 2;
        }
    }
    else {
        die 'must not be greater than 11 digits' if length $number > 11;
        die 'must not be fewer than 10 digits'   if length $number < 10;
        die 'letters not permitted'              if $number =~ /[a-z]/i;
        die 'punctuations not permitted'         if $number =~ /\W/;
        die '11 digits must start with 1';
    }
    return $1;
}

1;
