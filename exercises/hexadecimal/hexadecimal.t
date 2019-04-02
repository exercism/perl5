#!/usr/bin/env perl
use strict;
use warnings;

use Test::More;
use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

my @cases = (
  { hex     => '1',
    decimal => 1,
  },
  { hex     => 'c',
    decimal => 12,
  },
  { hex     => '10',
    decimal => 16,
  },
  { hex     => 'af',
    decimal => 175,
  },
  { hex     => '100',
    decimal => 256,
  },
  { hex     => '19ace',
    decimal => 105166,
  },
  { hex     => 'carrot',
    decimal => 0,
  },
  { hex     => '000000',
    decimal => 0,
  },
  { hex     => 'ffffff',
    decimal => 16777215,
  },
  { hex     => 'ffff00',
    decimal => 16776960,
  },
);

my $module = 'Hexadecimal';

plan tests => 4 + @cases;

ok -e "$Bin/$module.pm", "Missing $module.pm"
  or BAIL_OUT "You need to create file: $module.pm";
eval "use $module";

ok !$@, "Cannot load $module"
  or BAIL_OUT "Cannot load $module. Does it compile? Does it end with 1;?";
can_ok $module, "new"        or BAIL_OUT "Missing package $module; or missing sub new()";
can_ok $module, "to_decimal" or BAIL_OUT "Missing package $module; or missing sub to_decimal()";

foreach my $c (@cases) {
  my $hex = $module->new( $c->{hex} );
  is $hex->to_decimal, $c->{decimal}, "convert $c->{hex} to $c->{decimal}";
}
