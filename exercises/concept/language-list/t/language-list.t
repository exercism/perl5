#!/usr/bin/env perl

use v5.38;
use Test2::V0;

use LanguageList ();

is(
    \@LanguageList::Languages,
    [],
    '@Languages array is empty',
);

subtest 'add_language()' => sub { # begin: add_language
    LanguageList::add_language('Perl');
    is(
        \@LanguageList::Languages,
        ['Perl'],
        'add_language() adds Perl to the @Languages array',
    );

    LanguageList::add_language('Raku');
    is(
        \@LanguageList::Languages,
        ['Perl', 'Raku'],
        'add_language() adds Raku to the @Languages array',
    );

    LanguageList::add_language('Ruby');
    is(
        \@LanguageList::Languages,
        ['Perl', 'Raku', 'Ruby'],
        'add_language() adds Ruby to the @Languages array',
    );
}; # end: add_language

subtest 'remove_language()' => sub { # begin: remove_language
    LanguageList::remove_language();
    is(
        \@LanguageList::Languages,
        ['Perl', 'Raku'],
        'remove_language() removes Ruby from the @Languages array',
    );

    LanguageList::remove_language();
    is(
        \@LanguageList::Languages,
        ['Perl'],
        'remove_language() removes Raku from the @Languages array',
    );

    LanguageList::remove_language();
    is(
        \@LanguageList::Languages,
        [],
        'remove_language() removes Perl from the @Languages array',
    );
}; # end: remove_language

subtest 'first_language()' => sub { # begin: first_language
    is(
        LanguageList::first_language(),
        undef,
        'first_language() returns undef from empty @Languages array',
    );

    LanguageList::add_language('Ruby');
    is(
        LanguageList::first_language(),
        'Ruby',
        'first_language() returns Ruby from the 1 element @Languages array',
    );

    LanguageList::add_language('Perl');
    is(
        LanguageList::first_language(),
        'Ruby',
        'first_language() returns Ruby from the 2 element @Languages array',
    );
}; # end: first_language

subtest 'last_language()' => sub { # begin: last_language
    LanguageList::add_language('Raku');
    is(
        LanguageList::last_language(),
        'Raku',
        'last_language() returns Raku from the @Languages array',
    );

    LanguageList::remove_language();
    is(
        LanguageList::last_language(),
        'Perl',
        'last_language() returns Perl from the @Languages array',
    );

    LanguageList::remove_language();
    is(
        LanguageList::last_language(),
        'Ruby',
        'last_language() returns Ruby from the @Languages array',
    );

    LanguageList::remove_language();
    is(
        LanguageList::last_language(),
        undef,
        'last_language() returns undef from the empty @Languages array',
    );
}; # end: last_language

subtest 'nth_language($n)' => sub { # begin: nth_language
    LanguageList::add_language('Raku');
    LanguageList::add_language('Ruby');
    LanguageList::add_language('Perl');

    is(
        LanguageList::nth_language(1),
        'Raku',
        'nth_language(1) returns Raku from the @Languages array',
    );

    is(
        LanguageList::nth_language(2),
        'Ruby',
        'nth_language(2) returns Ruby from the @Languages array',
    );

    is(
        LanguageList::nth_language(3),
        'Perl',
        'nth_language(3) returns Perl from the @Languages array',
    );

    LanguageList::remove_language();
    LanguageList::remove_language();
    LanguageList::add_language('Perl');
    LanguageList::add_language('Ruby');

    is(
        LanguageList::nth_language(2),
        'Perl',
        'nth_language(2) returns Perl from the @Languages array',
    );

    is(
        LanguageList::nth_language(3),
        'Ruby',
        'nth_language(3) returns Ruby from the @Languages array',
    );
}; # end: nth_language

done_testing;
