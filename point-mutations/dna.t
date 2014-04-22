use strict;
use warnings;

use Test::More;
use JSON qw(from_json);

my $module = $ENV{EXERCISM} ? 'Example' : 'DNA'; 

my $cases_file = 'cases.json';
my $cases;
if (open my $fh, '<', $cases_file) {
    local $/ = undef;
    $cases = from_json scalar <$fh>;
} else {
    die "Could not open '$cases_file' $!";
}

plan tests => 4 + @$cases;

ok -e "$module.pm", "missing $module.pm"
    or BAIL_OUT("You need to create a class called $module.pm with a constructor called new.");

eval "use $module";
ok !$@, "Cannot load $module.pm"
    or BAIL_OUT("Does $module.pm compile?  Does it end with 1; ? ($@)");

can_ok($module, 'new') or BAIL_OUT("Missing package $module; or missing sub new()");
can_ok($module, 'hamming_distance') or BAIL_OUT("Missing package $module; or

missing sub hamming_distance()");

foreach my $c (@$cases) {
   is $module->new($c->{strand})->hamming_distance($c->{input}),
      $c->{expected},
      $c->{name};
}
