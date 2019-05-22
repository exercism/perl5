#!/usr/bin/env perl
use strict;
use warnings;

use Test2::Bundle::More;
use JSON::PP qw(decode_json);
use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

my $module = 'Deque';

my $cases;
{
  local $/ = undef;
  $cases = decode_json scalar <DATA>;
}

#plan 3 + @$cases;
#diag explain $cases;

ok -e "$Bin/$module.pm", "missing $module.pm"
  or BAIL_OUT(
  "You need to create a class called $module.pm with a constructor called new."
  );

eval "use $module";
ok !$@, "Cannot load $module.pm"
  or BAIL_OUT("Does $module.pm compile?  Does it end with 1; ? ($@)");

can_ok( $module, 'new' )
  or BAIL_OUT("Missing package $module; or missing sub new()");

foreach my $c (@$cases) {
  diag "Start $c->{name}";
  my $q = $module->new;
  foreach my $s ( @{ $c->{set} } ) {
    foreach my $command (qw(push unshift)) {
      if ( exists $s->{$command} ) {
        $q->$command( $s->{$command} );
      }
    }
    foreach my $assert (qw(pop shift)) {
      if ( exists $s->{$assert} ) {
        is $q->$assert, $s->{$assert}, "$c->{name} $assert";
      }
    }
  }
}

done_testing();

__DATA__
[
  {
    "set" : [
      { "push" : 10 },
      { "push" : 20 },
      { "pop"  : 20 },
      { "pop"  : 10 }
    ],
    "name" : "push_pop"
  },
  {
    "set" : [
      { "push" : 10  },
      { "push" : 20  },
      { "shift" : 10 },
      { "shift" : 20 }
    ],
    "name" : "push_shift"
  },
  {
    "set" : [
      { "unshift" : 10 },
      { "unshift" : 20 },
      { "shift"   : 20 },
      { "shift"   : 10 }
    ],
    "name" : "unshift_shift"
  },
  {
    "set" : [
      { "unshift" : 10 },
      { "unshift" : 20 },
      { "pop"     : 10 },
      { "pop"     : 20 }
    ],
    "name" : "unshift_pop"
  },
  {
    "set" : [
      { "push"    : 10 },
      { "push"    : 20 },
      { "pop"     : 20 },
      { "push"    : 30 },
      { "shift"   : 10 },
      { "unshift" : 40 },
      { "push"    : 50 },
      { "shift"   : 40 },
      { "pop"     : 50 },
      { "shift"   : 30 }
    ],
    "name" : "example"
  }
]

