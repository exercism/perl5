#!/usr/bin/env perl
use strict; 
use warnings; 

use Data::Dumper; 
use Test::Exception; 
use Test::More;
use FindBin;
my $dir;
BEGIN { $dir = $FindBin::Bin . '/' };
use lib $dir;

my $module = $ENV{EXERCISM} ? 'Example' : 'BinarySearch';

my %test_cases = (
   dies => {
      tests => [
         {  name  => 'unsorted numeric array dies',
            input => [qw(5 4 3 2 1)],
            key   => 1,
         },
         {  name  => 'unsorted string array dies',
            input => [qw(f e d c b a)],
            key   => 'f',
         }
      ],
   },
   search_and_find => {
      tests => [
         {  name     => 'finds correct number',
            input    => [qw(1 2 3 4 5 6)],
            key      => 1,
            expected => 0,
         },
         {  name     => 'finds correct string',
            input    => [qw(a b c d e f)],
            key      => 'f',
            expected => 5,
         },
      ],
   },
   search_and_dont_find => {
      tests => [
         {  name     => 'does not find missing number',
            input    => [qw(3 4 5 6 7 8)],
            key      => 1,
            expected => undef,
         },
         {  name     => 'does not find missing string',
            input    => [qw(e g i q z)],
            key      => 'a',
            expected => undef,
         },
      ],
   },
   phonebook => {
      numbers => [qw(0407806797 0684947123 1079943381 1185607368 1434201509
         1688514914 2114575657 2114986442 2243518982 2352008489 2502008897
         2585763976 2968294610 3224727681 3435565486 3477995368 3698166412
         3721685899 3923488029 4249932791 4448688880 4616016449 4619411328
         4983884178 5254396673 5299517105 5481666467 5707852858 6190903072
         6213954897 6654597812 6804362713 6815481586 6906511863 6924155360
         7023698560 7107821578 7143580478 7151514144 7362592053 7867168451
         8297108636 8454698650 8549803216 8701423878 9305289274 9540085452
         9595200548 9734664447 9909223246)],
      names => [qw(Alta Amanda Amy Andres Andy Angeles Anissa Becky Belinda
         Bree Brenton Brianne Carla Claudio Colton Consuela Contessa Dacia
         Darleen Divina Domenic Evelin Evia Georgine Hal Hana Harris Hollie
         Jeneva Johnette Julietta Kaley Karl Kristian Kyla Kyoko Larhonda
         Laverne Marcene Marcia Marylin Michelle Ranae Rossie Rubye Rupert
         Somer Steffanie Tanika Valerie)],
      tests => [
         {  name     => 'Found correct number for Carla',
            key      => 'Carla',
            expected => '2968294610',
         },
         {  name     => 'Found correct number for Alta',
            key      => 'Alta',
            expected => '0407806797',
         },
         {  name     => "Did not find number for 'Aizen'",
            key      => 'Aizen',
            expected => undef,
         },
      ],
   },
);

my $num_test_cases;
foreach my $test_type ( keys %test_cases ) {
   $num_test_cases += @{ $test_cases{$test_type}->{tests} };
}

plan tests => 3 + $num_test_cases;

ok -e "${dir}${module}.pm", "missing $module.pm"
   or BAIL_OUT("You need to create a class called $module.pm with 1 functions: binary_search");

eval "use $module";
ok !$@, "Cannot load $module.pm"
   or BAIL_OUT("Does $module.pm compile? Does it end with 1; ? ($@)");

can_ok($module, 'binary_search')
   or BAIL_OUT("Missing package $module; or missing sub binary_search()");

foreach my $test_type (keys %test_cases) {
   no strict 'refs';
   my $f = "${module}::binary_search";
   foreach my $test ( @{ $test_cases{$test_type}->{tests} } ) {
      if ( $test_type eq 'dies' ) {
         dies_ok { 
            $f->($test->{key}, $test->{input})
         } $test->{name};
      }     
      elsif ( $test_type =~ m/^search_and/ ) {
         is(
            $f->($test->{key}, $test->{input}),
            $test->{expected},
            $test->{name}
         );
      }
      elsif ( $test_type eq 'phonebook' ) {
         my $names   = $test_cases{$test_type}->{names};
         my $numbers = $test_cases{$test_type}->{numbers};

         my $index = $f->($test->{key}, $names);
         is(
            defined $index ? $numbers->[$index] : undef,
            $test->{expected},
            $test->{name},
         );
      }
   }
}
