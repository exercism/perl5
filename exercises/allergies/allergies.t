use strict;
use warnings;

use Test::More;
use JSON qw(from_json);

my $module = $ENV{EXERCISM} ? 'Example' : 'Allergies';

my $cases_file = 'cases.json';
my $cases;

if (open my $fh, '<', $cases_file) {
    local $/ = undef;
    $cases = from_json scalar <$fh>;
} else {
    die "Could not open '$cases_file' $!";
}

plan tests => 4 + @$cases;

ok -e "$module.pm", "Missing $module.pm" or BAIL_OUT "Missing $module.pm";

eval "use $module";
ok !$@, "Cannot load $module.pm"
    or BAIL_OUT("Does $module.pm compile?  Does it end with 1; ?");

can_ok $module, "allergic_to" or BAIL_OUT("Missing package $module; or missing sub allergic_to()");
can_ok $module, "list"        or BAIL_OUT("Missing package $module; or missing sub list()");

foreach my $c (@$cases) {
    if ($c->{sub} eq 'allergic_to'){
        my $allergy = $module->new($c->{input}->[0]);
        is $allergy->allergic_to($c->{input}->[1]),  $c->{expected}, $c->{name};
    }
    if ($c->{sub} eq 'list'){
        my $allergy = $module->new($c->{input});
        is_deeply $allergy->list(), $c->{expected}, $c->{name};
    }
}
