#!/usr/bin/env perl
use lib::gitroot qw<:lib :once>;
use Test2::V0 -target => 'Exercism::Generator';

is $CLASS->new( exercise => 'hello-world', case_uuids => [] ), object {
    call package    => 'HelloWorld';
    call case_uuids => [];
    call cases      => [];
    call json_tests => '';
}, '0 case UUIDs';

is $CLASS->new(
    exercise   => 'hello-world',
    case_uuids => [qw<af9ffe10-dc13-42d8-a742-e7bdafac449d>],
    data       => { package => 'TEST' },
    ),
    object {
    call package    => 'TEST';
    call case_uuids => [qw<af9ffe10-dc13-42d8-a742-e7bdafac449d>];
    call cases => [
        {   description => 'Say Hi!',
            property    => 'hello',
            input       => {},
            expected    => 'Hello, World!',
        }
    ];
    call json_tests => <<'JSON' =~ s/^\s+|\s+$//gr;
[
  {
    "description": "Say Hi!",
    "expected": "Hello, World!",
    "input": {},
    "property": "hello"
  }
]
JSON
    }, '1 case UUID';

done_testing;
