#!/usr/bin/env perl
use strict;
use warnings;
use FindBin;
my $dir;
BEGIN { $dir = $FindBin::Bin . '/' };
use lib $dir;

my $module = $ENV{EXERCISM} ? 'Example' : 'Bob';

use Test::More tests => 28;

my @cases = map {
    {
        input   => $_->[0],
        expect  => $_->[1],
        desc    => $_->[2],
    }
} (
    # input                                                 expected output       title
    ['Tom-ay-to, tom-aaaah-to.',                            'Whatever.',          'stating something'],
    ['WATCH OUT!',                                          'Whoa, chill out!',   'shouting'],
    ['FCECDFCAAB',                                          'Whoa, chill out!',   'shouting gibberish'],
    ['Does this cryogenic chamber make me look fat?',       'Sure.',              'asking a question'],
    ['You are, what, like 15?',                             'Sure.',              'asking a numeric question'],
    ['fffbbcbeab?',                                         'Sure.',              'asking gibberish'],
    ["Let's go make out behind the gym!",                   'Whatever.',          'talking forcefully'],
    ["It's OK if you don't want to go to the DMV.",         'Whatever.',          'using acronyms in regular speech'],
    ['WHAT THE HELL WERE YOU THINKING?',                    'Whoa, chill out!',   'forceful question'],
    ['1, 2, 3 GO!',                                         'Whoa, chill out!',   'shouting numbers'],
    ['1, 2, 3',                                             'Whatever.',          'only numbers'],
    ['4?',                                                  'Sure.',              'question with only numbers'],
    ['ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!',       'Whoa, chill out!',   'shouting with special characters'],
    ['I HATE YOU',                                          'Whoa, chill out!',   'shouting with no exclamation mark'],
    ['Ending with ? means a question.',                     'Whatever.',          'statement containing question mark'],
    [':) ?',                                                'Sure.',              'non-letters with question'],
    ["Wait! Hang on. Are you going to be OK?",              'Sure.',              'prattling on'],
    ['',                                                    'Fine. Be that way!', 'silence'],
    ['    ',                                                'Fine. Be that way!', 'prolonged silence'],
    ["\t\t\t\t\t\t\t\t\t\t",                                'Fine. Be that way!', 'alternate silence'],
    ["\nDoes this cryogenic chamber make me look fat?\nno", 'Whatever.',          'multiple line question'],
    ['         hmmmmmmm...',                                'Whatever.',          'starting with whitespace'],
    ['Okay if like my  spacebar  quite a bit?   ',          'Sure.',              'ending with whitespace'],
    ["\n\r \t",                                             'Fine. Be that way!', 'other whitespace'],
    ['This is a statement ending with whitespace      ',    'Whatever.',          'non-question ending with whitespace'],
);

ok -e "${dir}${module}.pm", "missing $module.pm"
    or BAIL_OUT("You need to create a module called $module.pm with a function called hey() that gets one parameter: The text Bob hears.");

use_ok($module)
    or BAIL_OUT("Does $module.pm compile?  Does it end with 1; ?");

can_ok($module, 'hey')
    or BAIL_OUT("Missing package $module; or missing sub hey()");

my $sub = $module->can('hey');

foreach my $c (@cases) {
    my $title = $c->{desc} ? "$c->{desc}: $c->{input}" : $c->{input};
    is $sub->( $c->{input} ), $c->{expect}, $title;
}
