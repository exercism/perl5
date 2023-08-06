package LanguageList;

use v5.38;
use List::Util qw<any>;

our @Languages;

sub add_language ($language) {
    push @Languages, $language;
}

sub remove_language () {
    pop @Languages;
}

sub first_language () {
    return $Languages[0];
}

sub last_language () {
    return $Languages[-1];
}

sub get_languages (@elems) {
    return @Languages[ map { $_ - 1 } @elems ];
}

sub has_language ($language) {
    return any { $_ eq $language } @Languages;
}
