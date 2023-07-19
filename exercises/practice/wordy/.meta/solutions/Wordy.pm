package Wordy;

use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<answer>;

# Solution (mostly) by GitHub Copilot
sub answer ($question) {

    # Remove the "What is " prefix and "?" suffix from the question
    $question =~ s/^What is ?(.*)\?$/$1/;

    # Remove "by" from the question
    $question =~ s/\bby\b//g;

    # Split the question into tokens
    my @tokens = split /\s+/, $question;

    # Initialize the result to the first number
    my $result = shift @tokens;
    die 'syntax error' unless defined $result;

    # Process the remaining tokens
    while (@tokens) {
        my $op = shift @tokens;

        # Get the next number
        my $num = shift @tokens // '';

        die "syntax error" if $op =~ /^-?\d+$/;

        # Check if the operator is valid
        die "unknown operation" unless $op =~ /^(plus|minus|multiplied|divided)$/;

        # Check if the number is valid
        die "syntax error" unless $num =~ /^-?\d+$/;

        # Apply the operator to the result and the number
        if ( $op eq "plus" ) {
            $result += $num;
        } elsif ( $op eq "minus" ) {
            $result -= $num;
        } elsif ( $op eq "multiplied" ) {
            $result *= $num;
        } elsif ( $op eq "divided" ) {
            die "division by zero" if $num == 0;
            $result /= $num;
        }
    }

    # Return the result
    return $result;
}

1;
