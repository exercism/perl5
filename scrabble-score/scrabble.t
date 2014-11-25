use strict;
use warnings;
use 5.10.0;

use Test::More;

# set EXERCISM_EXTENDED=1 to run extended test cases
use constant TEST_EXTENDED => $ENV{EXERCISM_EXTENDED} // 0;

my @cases = map { _make_test_case(@$_) } (
    [ "",                   0, [], "empty word" ],
    [ " \t\n",              0, [], "whitespace" ],
    [ "a",                  1],
    [ "f",                  4],
    [ "street",             6],
    [ "quirky",             22],
    [ "MULTIBILLIONAIRE",   20],
);

my @extended_cases = map { _make_test_case(@$_) } (
    [ "quirky", 44,     [ double => 1 ],                "double 'quirky'" ],
    [ "quirky", 88,     [ double => 2 ],                "double-double 'quirky'" ],
    [ "quirky", 66,     [ triple => 1 ],                "triple 'quirky'" ],
    [ "quirky", 198,    [ triple => 2 ],                "triple-triple 'quirky'" ],
    [ "quirky", 132,    [ double => 1, triple => 1 ],   "double-triple 'quirky'" ],
);

my $module = $ENV{EXERCISM} ? 'Example' : 'Word';

ok -e "$module.pm", "Find $module.pm"
    or die "You need to create file: $module.pm";
use_ok $module
    or die "Cannot load $module. Does it compile? Does it end with 1;?";
can_ok $module, (qw/new score/)
    or die "Missing package $module or needed sub not found";

for my $c (@cases) {
    is $module->new( $c->{word} )->score(), $c->{score}, $c->{desc};
}

SKIP: {
    skip "only if extensions are enabled. double and triple", scalar @extended_cases
        unless TEST_EXTENDED;
    for my $c (@extended_cases) {
        is $module->new( $c->{word} )->score(@{ $c->{options} }), $c->{score}, $c->{desc};
    }
}

done_testing();

sub _make_test_case {
    my ($word, $score, $options, $desc) = @_;

    return {
        word    => $word,
        score   => $score,
        options => $options // [],
        desc    => "score for " . ($desc // "'$word'")
    };
}

