#!/usr/bin/env perl
use strict;
use warnings;

use Test2::Bundle::More;
use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

my $full_garden
  = "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV";

my @cases = (
  { garden   => "RC\nGG",
    student  => "alice",
    expected => [qw(radishes clover grass grass)],
    name     => "small garden"
  },
  { garden   => "VC\nRC",
    student  => "alice",
    expected => [qw(violets clover radishes clover)],
    name     => "small garden"
  },
  { garden   => "VVCG\nVVRC",
    student  => "bob",
    expected => [qw(clover grass radishes clover)],
    name     => "small garden"
  },
  { garden   => "VVCCGG\nVVCCGG",
    student  => "bob",
    expected => [qw(clover clover clover clover)],
    name     => "small garden"
  },
  { garden   => "VVCCGG\nVVCCGG",
    student  => "charlie",
    expected => [qw(grass grass grass grass)],
    name     => "small garden"
  },
  { garden   => $full_garden,
    student  => "alice",
    expected => [qw(violets radishes violets radishes)],
    name     => "full garden"
  },
  { garden   => $full_garden,
    student  => "bob",
    expected => [qw(clover grass clover clover)],
    name     => "full garden"
  },
  { garden   => $full_garden,
    student  => "charlie",
    expected => [qw(violets violets clover grass)],
    name     => "full garden"
  },
  { garden   => $full_garden,
    student  => "david",
    expected => [qw(radishes violets clover radishes)],
    name     => "full garden"
  },
  { garden   => $full_garden,
    student  => "eve",
    expected => [qw(clover grass radishes grass)],
    name     => "full garden"
  },
  { garden   => $full_garden,
    student  => "fred",
    expected => [qw(grass clover violets clover)],
    name     => "full garden"
  },
  { garden   => $full_garden,
    student  => "ginny",
    expected => [qw(clover grass grass clover)],
    name     => "full garden"
  },
  { garden   => $full_garden,
    student  => "harriet",
    expected => [qw(violets radishes radishes violets)],
    name     => "full garden"
  },
  { garden   => $full_garden,
    student  => "ileana",
    expected => [qw(grass clover violets clover)],
    name     => "full garden"
  },
  { garden   => $full_garden,
    student  => "joseph",
    expected => [qw(violets clover violets grass)],
    name     => "full garden"
  },
  { garden   => $full_garden,
    student  => "kincaid",
    expected => [qw(grass clover clover grass)],
    name     => "full garden"
  },
  { garden   => $full_garden,
    student  => "larry",
    expected => [qw(grass violets clover violets)],
    name     => "full garden"
  },
  { garden   => "VCRRGVRG\nRVGCCGCV",
    student  => "patricia",
    students => [qw(Samantha Patricia Xander Roger)],
    expected => [qw(violets clover radishes violets)],
    name     => "unsorted students"
  },
  { garden   => "VCRRGVRG\nRVGCCGCV",
    student  => "roger",
    students => [qw(Samantha Patricia Xander Roger)],
    expected => [qw(radishes radishes grass clover)],
    name     => "unsorted students"
  },
  { garden   => "VCRRGVRG\nRVGCCGCV",
    student  => "samantha",
    students => [qw(Samantha Patricia Xander Roger)],
    expected => [qw(grass violets clover grass)],
    name     => "unsorted students"
  },
  { garden   => "VCRRGVRG\nRVGCCGCV",
    student  => "xander",
    students => [qw(Samantha Patricia Xander Roger)],
    expected => [qw(radishes grass clover violets)],
    name     => "unsorted students"
  },
  { garden   => "VCRRGVRG\nRVGCCGCV",
    student  => "bob",
    students => [qw(Alice Bob Charlie Dan)],
    expected => [qw(radishes radishes grass clover)],
    name     => "same garden different students"
  },
  { garden   => "VCRRGVRG\nRVGCCGCV",
    student  => "bob",
    students => [qw(Bob Charlie Dan Erin)],
    expected => [qw(violets clover radishes violets)],
    name     => "same garden different students"
  },
  { garden   => "VCRRGVRG\nRVGCCGCV",
    student  => "charlie",
    students => [qw(Alice Bob Charlie Dan)],
    expected => [qw(grass violets clover grass)],
    name     => "same garden different students"
  },
  { garden   => "VCRRGVRG\nRVGCCGCV",
    student  => "charlie",
    students => [qw(Bob Charlie Dan Erin)],
    expected => [qw(radishes radishes grass clover)],
    name     => "same garden different students"
  },
);

my $module = 'Kindergarten';

plan 3 + @cases;

ok -e "$Bin/$module.pm", "Missing $module.pm"
  or BAIL_OUT "You need to create file: $module.pm";

eval "use $module";

ok !$@, "Cannot load $module"
  or BAIL_OUT
  "Cannot load $module. Does it compile? Does it end with 1;?";

can_ok $module, "new"
  or BAIL_OUT "Missing package $module; or missing sub new()";

foreach my $c (@cases) {
  my $garden = do {
    if ( $c->{students} ) {
      $module->new( $c->{garden}, $c->{students} );
    }
    else {
      $module->new( $c->{garden} );
    }
  };
  my $student = $c->{student};

  no strict 'refs';
  is_deeply $garden->$student(), $c->{expected},
    "$c->{name} : $c->{student}'s garden is [@{ $c->{expected} }]";
}
