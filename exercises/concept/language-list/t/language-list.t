#!/usr/bin/env perl

use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use LanguageList ();

subtest 'add_language()' => sub { # begin: add_language task: 1
    is(
        \@LanguageList::Languages,
        [],
        'The @Languages array is empty',
    );

    LanguageList::add_language('Perl');
    is(
        \@LanguageList::Languages,
        ['Perl'],
        'add_language() adds Perl to the @Languages array',
    );

    LanguageList::add_language('Raku');
    is(
        \@LanguageList::Languages,
        [ 'Perl', 'Raku' ],
        'add_language() adds Raku to the @Languages array',
    );

    LanguageList::add_language('Ruby');
    is(
        \@LanguageList::Languages,
        [ 'Perl', 'Raku', 'Ruby' ],
        'add_language() adds Ruby to the @Languages array',
    );

    undef @LanguageList::Languages;
}; # end: add_language

subtest 'remove_language()' => sub { # begin: remove_language task: 2
    @LanguageList::Languages = qw< Perl Raku Ruby >;

    LanguageList::remove_language();
    is(
        \@LanguageList::Languages,
        [ 'Perl', 'Raku' ],
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

    undef @LanguageList::Languages;
}; # end: remove_language

subtest 'first_language()' => sub { # begin: first_language task: 3
    is(
        LanguageList::first_language(),
        undef,
        'first_language() returns undef from the empty @Languages array',
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

    undef @LanguageList::Languages;

    LanguageList::add_language('Perl');
    is(
        LanguageList::first_language(),
        'Perl',
        'first_language() returns Perl from the 1 element @Languages array',
    );

    LanguageList::add_language('Raku');
    is(
        LanguageList::first_language(),
        'Perl',
        'first_language() returns Perl from the 2 element @Languages array',
    );

    undef @LanguageList::Languages;
}; # end: first_language

subtest 'last_language()' => sub { # begin: last_language task: 4
    @LanguageList::Languages = qw< Ruby Perl >;

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

    undef @LanguageList::Languages;
}; # end: last_language

subtest 'get_languages(@elements)' => sub { # begin: get_languages task: 5
    @LanguageList::Languages = qw< Raku Ruby Perl >;

    is(
        [ LanguageList::get_languages(1) ],
        ['Raku'],
        'Get the 1st language from the @Languages array',
    );

    is(
        [ LanguageList::get_languages( 2, 3 ) ],
        [ 'Ruby', 'Perl' ],
        'Get the 2nd and 3rd languages from the @Languages array',
    );

    is(
        [ LanguageList::get_languages( 3, 1, 2 ) ],
        [ 'Perl', 'Raku', 'Ruby' ],
        'Get reordered languages from the @Languages array',
    );

    @LanguageList::Languages = qw< Raku Perl Ruby >;

    is(
        [ LanguageList::get_languages( 1, 3 ) ],
        [ 'Raku', 'Ruby' ],
        'Get the 1st and 3rd languages from the @Languages array',
    );

    is(
        [ LanguageList::get_languages( 2, 1 ) ],
        [ 'Perl', 'Raku' ],
        'Get the 2nd and 1st languages from the @Languages array',
    );

    undef @LanguageList::Languages;
}; # end: get_languages

subtest 'has_language($language)' => sub { # begin: has_language task: 6
    @LanguageList::Languages = qw< Raku Perl >;

    is(
        LanguageList::has_language('Perl'),
        T,
        '@Languages array contains Perl',
    );

    is(
        LanguageList::has_language('Raku'),
        T,
        '@Languages array contains Raku',
    );

    is(
        LanguageList::has_language('JavaScript'),
        DF,
        '@Languages array does not contain JavaScript',
    );

    is(
        LanguageList::has_language('Gleam'),
        DF,
        '@Languages array does not contain Gleam',
    );

    undef @LanguageList::Languages;
}; # end: has_language

done_testing;
