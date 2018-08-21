#!/usr/bin/env perl
use strict;
use warnings;

use Test::More;
use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

my @cases = (
    # test encode
   {
        encode   => 1,
        key      => 'dddddddddddddddddddd',
        input    => 'programmingisawesome',
        expected => 'surjudpplqjlvdzhvrph',
        name     => 'same letter key'
   },
   {
        encode   => 1,
        key      => 'dddddddddddddd',
        input    => 'todayisholiday',
        expected => 'wrgdblvkrolgdb',
        name     => 'same letter key with wrapping',
   },
   {
        encode   => 1,
        key      => 'qgbvno',
        input    => 'coffee',
        expected => 'sugars',
        name     => 'different letter keys with wrapping',
   },
   {
        encode   => 1,
        key      => 'qgbvno',
        input    => 'cof-FEE, 123!',
        expected => 'sugars',
        name     => 'normalize input. remove non-alpha characters, lowercase alpha',
   },
   {
        encode   => 1,
        input    => 'adaywithoutlaughterisadaywasted',
        expected => 'adaywithoutlaughterisadaywasted',
        name     => 'with default key "a"',
   },
    # test decode
   {
        decode   => 1,
        key      => 'dddddddddddddddddddd',
        input    => 'surjudpplqjlvdzhvrph',
        expected => 'programmingisawesome',
        name     => 'same letter key'
   },
   {
        decode   => 1,
        key      => 'dddddddddddddd',
        input    => 'wrgdblvkrolgdb',
        expected => 'todayisholiday',
        name     => 'same letter key with wrapping',
   },
   {
        decode   => 1,
        input    => 'adaywithoutlaughterisadaywasted',
        expected => 'adaywithoutlaughterisadaywasted',
        name     => 'with default key "a"',
   },
   # text cipher key exceptions
   {
        exception => 1,
        input     => 'ABCDEF',
        expected  => 'ArgumentError',
        name      => 'exception UPPERCASE key',
   },
   {
        exception => 1,
        input     => '12345',
        expected  => 'ArgumentError',
        name      => 'exception numeric key',
   },
   {
        exception => 1,
        input     => '',
        expected  => 'ArgumentError',
        name      => 'exception blank key',
   }
);

plan tests => 5 + @cases;

my $module = 'Cipher';

ok -e "$Bin/$module.pm", "Missing $module.pm"
            or BAIL_OUT "You need to create file: $module.pm";

eval "use $module";

ok !$@, "Cannot load $module"
            or BAIL_OUT "Cannot load $module. Does it compile? Does it end with 1;?";

can_ok $module, "new"    or BAIL_OUT "Missing package $module; or missing sub new()";
can_ok $module, "encode" or BAIL_OUT "Missing package $module; or missing sub encode()";
can_ok $module, "decode" or BAIL_OUT "Missing package $module; or missing sub decode()";

foreach my $c (@cases) {
    if (exists $c->{exception}) {
        eval { $module->new($c->{input}) };
        like $@, qr/$c->{expected}/, $c->{name};
        next;
    }

    my $cipher = exists $c->{key} ? $module->new($c->{key}) : $module->new;

    if (exists $c->{encode}) {
        is $cipher->encode($c->{input}), $c->{expected}, "encode " . $c->{name};
    }
    if (exists $c->{decode}) {
        is $cipher->decode($c->{input}), $c->{expected}, "decode " . $c->{name};
    }
}
