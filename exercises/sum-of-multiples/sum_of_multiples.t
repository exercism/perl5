#!/usr/bin/env perl
use strict;
use warnings;

use Test2::Bundle::More;
use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

my $module = 'SumOfMultiples';

my @cases = (
  { factors  => [ 3, 5 ],
    limit    => 1,
    expected => 0
  },
  { factors  => [ 3, 5 ],
    limit    => 4,
    expected => 3
  },
  { factors  => [ 3, 5 ],
    limit    => 10,
    expected => 23
  },
  { factors  => [ 3, 5 ],
    limit    => 100,
    expected => 2318
  },
  { factors  => [ 3, 5 ],
    limit    => 1000,
    expected => 233168
  },
  { factors  => [ 7, 13, 17 ],
    limit    => 20,
    expected => 51
  },
  { factors  => [ 4, 6 ],
    limit    => 15,
    expected => 30
  },
  { factors  => [ 5, 6, 8 ],
    limit    => 150,
    expected => 4419
  },
  { factors  => [ 5, 25 ],
    limit    => 51,
    expected => 275
  },
  { factors  => [ 43, 47 ],
    limit    => 10000,
    expected => 2203160
  },
  { factors  => [1],
    limit    => 100,
    expected => 4950
  },
  { factors  => [],
    limit    => 10000,
    expected => 0
  }
);

plan 4 + scalar @cases;

ok -e "$Bin/$module.pm", "Missing $module.pm"
  or BAIL_OUT "You need to create file: $module.pm";

eval "use $module";
ok !$@, "Cannot load $module"
  or BAIL_OUT
  "Cannot load $module; Does it compile? Does it end with 1;?";

can_ok $module, "new"
  or BAIL_OUT "Missing package $module; or missing sub new()";
can_ok $module, "to"
  or BAIL_OUT "Missing package $module; or missing sub to()";

for my $case (@cases) {
  my @factors = @{ $case->{factors} };
  my $desc    = sprintf "Multiples of %s up to %s equals %s",
    ( scalar @factors ? ( join ' and ', @factors ) : 'nothing' ),
    $case->{limit}, $case->{expected};

  is $module->new(@factors)->to( $case->{limit} ), $case->{expected},
    $desc;
}

