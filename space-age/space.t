use strict;
use warnings;

use Test::More; 

my $module = $ENV{EXERCISM} ? 'Example' : 'SpaceAge';

plan tests => 20;

ok -e "$module.pm", "Missing $module.pm"
        or BAIL_OUT "You need to create file: $module.pm";

eval "use $module";
ok !$@, "Cannot load $module"
        or BAIL_OUT "Cannot load $module; Does it compile? Does it end with 1;?";

can_ok $module, "new"     or BAIL_OUT "Missing package $module; or missing sub new()";
can_ok $module, "seconds" or BAIL_OUT "Missing package $module; or missing sub seconds()";

is $module->new(1_000_000)->seconds, 1_000_000, "attribute->seconds match constructor param";
is $module->new(1_000_000_000)->on_earth, 31.69, "earth years";
is $module->new(2_134_835_688)->on_earth, 67.65, "earth years";
is $module->new(2_134_835_688)->on_mercury, 280.88, "mercury years";
is $module->new(189_839_836)->on_earth, 6.02, "earth years";
is $module->new(189_839_836)->on_venus, 9.78, "venus years";
is $module->new(2_329_871_239)->on_earth, 73.83, "earth years";
is $module->new(2_329_871_239)->on_mars, 39.25, "mars years";
is $module->new(901_876_382)->on_earth, 28.58, "earth years";
is $module->new(901_876_382)->on_jupiter, 2.41, "jupiter years";
is $module->new(3_000_000_000)->on_earth, 95.06, "earth years";
is $module->new(3_000_000_000)->on_saturn, 3.23, "saturn years";
is $module->new(3_210_123_456)->on_earth, 101.72, "earth years";
is $module->new(3_210_123_456)->on_uranus, 1.21, "uranus years";
is $module->new(8_210_123_456)->on_earth, 260.16, "earth years";
is $module->new(8_210_123_456)->on_neptune, 1.58, "neptune years";
