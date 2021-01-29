#!/usr/bin/env perl
use strict;
use warnings;

use Test2::Bundle::More;
use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

my $module = 'SecretHandshake';

plan 12;

ok -e "$Bin/$module.pm", "Missing $module.pm"
  or BAIL_OUT "You need to create file: $module.pm";
eval "use $module";
ok !$@, "Cannot load $module"
  or BAIL_OUT
  "Cannot load $module. Does it compile? Does it end with 1;?";

can_ok $module, "new"
  or BAIL_OUT "Missing package $module; or missing sub new()";
can_ok $module, "commands"
  or BAIL_OUT "Missing package $module; or missing sub commands()";

is_deeply $module->new(1)->commands, ["wink"], "handshake '1' is wink"
  or diag explain $module->new(1)->commands;
is_deeply $module->new(2)->commands, ["double blink"],
  "handshake '2' is double blink"
  or diag explain $module->new(2)->commands;
is_deeply $module->new(4)->commands, ["close your eyes"],
  "handshake '4' is close your eyes"
  or diag explain $module->new(4)->commands;
is_deeply $module->new(8)->commands, ["jump"], "handshake '8' is jump"
  or diag explain $module->new(8)->commands;
is_deeply $module->new(3)->commands, [ "wink", "double blink" ],
  "handshake '11' is wink, double blink"
  or diag explain $module->new(3)->commands;
is_deeply $module->new(19)->commands, [ "double blink", "wink" ],
  "reverse order of handshake commands"
  or diag explain $module->new(19)->commands;
is_deeply $module->new(31)->commands,
  [ "jump", "close your eyes", "double blink", "wink" ],
  "all handshake commands in reverse"
  or diag explain $module->new(31)->commands;
is_deeply $module->new('piggies')->commands, [], "invalid input"
  or diag explain $module->new('piggies');
