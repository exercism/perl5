use strict;
use warnings;

use Test::More;

my $module = $ENV{EXERCISM} ? 'Example' : 'Strain';

plan tests => 12;

ok -e "$module.pm", "Missing $module.pm" or BAIL_OUT "You need to create file $module.pm";

eval "use $module";
ok !$@, "Cannot load $module" or BAIL_OUT "Cannot load $module. Does it compile? Does it end with 1;?";

can_ok $module, "keep"    or BAIL_OUT "Missing package $module or missing sub keep()";
can_ok $module, "discard" or BAIL_OUT "Missing package $module or missing sub discard()";

my $keep    = \&{"${module}::keep"};
my $discard = \&{"${module}::discard"};
my ($input, $expected, $function);

$input    = [];
$expected = [];
$function = sub { my $x = shift; $x % 2 == 0};
is_deeply( $keep->($input, $function), $expected,
    "empty list" ) or diag explain $keep->($input, $function);

$input    = [2, 4, 6, 8, 10];
$expected = [];
$function = sub { my $x = shift; $x % 2 == 1 };
is_deeply( $keep->($input, $function), $expected,
    "keep odd numbers. empty result " ) or diag explain $keep->($input, $function);

$input    = [2, 4, 6, 8, 10];
$expected = [];
$function = sub { my $x = shift; $x % 2 == 0 };
is_deeply( $discard->($input, $function), $expected,
    "discard even numbers. empty result" ) or diag explain $discard->($input, $function);

$input    = [2, 4, 6, 8, 10];
$expected = [2, 4, 6, 8, 10];
$function = sub { my $x = shift; $x % 2 == 0 };
is_deeply( $keep->($input, $function), $expected,
    "keep even numbers. result == input" ) or diag explain $keep->($input, $function);

$input    = [qw(dough cash plough though through enough)];
$expected = ['cash'];
$function = sub { my $x = shift; $x =~ m/ough$/ };
is_deeply( $discard->($input, $function), $expected,
    "discard input endswith 'ough'" ) or diag explain $discard->($input, $function);

$input    = [qw(zebra arizona apple google mozilla)];
$expected = [qw(zebra arizona mozilla)];
$function = sub { my $x = shift; $x =~ /z/ };
is_deeply( $keep->($input, $function), $expected,
    "keep input with 'z'" ) or diag explain $keep->($input, $function);

$input    = ['1,2,3', 'one', 'almost!', 'love'];
$expected = [];
$function = sub { my $x = shift; $x =~ /\p{IsAlpha}/ };
is_deeply( $discard->($keep->($input, $function), $function), $expected,
    "keep then discard" ) or diag explain $discard->($keep->($input, $function), $function);

$input    = ['1,2,3', 'one', 'almost!', 'love'];
$expected = ['1,2,3', 'one', 'almost!', 'love'];
$function = sub { my $x = shift; $x =~ /\p{Alpha}/ };
my $combined = [@{ $keep->($input, $function) }, @{ $discard->($input, $function) }]; 
is_deeply( [sort @$combined], [sort @$expected],
    "combine keep and discard results. keep + discard" ) or diag explain [sort @$combined];
