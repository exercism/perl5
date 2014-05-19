#!/usr/bin/perl 

use strict; 
use warnings; 

use Example; 
use Test::Exception; 
use Test::More tests => 11; 

{ # works only on sorted data, error pattern can be anything
   throws_ok {
      Example::binary_search(1, qw(5 4 3 2 1));
   } qr/.*/,
   'dies on unsorted numeric array';

   throws_ok {
      Example::binary_search('a', qw(f e d c b a));
   } qr/.*/,
   'dies on unsorted string array';

   lives_ok {
      Example::binary_search(1, qw(1 2 3 4 5));
   } 'lives on sorted numeric array';

   lives_ok {
      Example::binary_search('a', qw(a b c d e f));
   } 'lives on sorted string array';
}

{ # finds correct index for existing elements
   is( 
      Example::binary_search(1, qw(1 2 3 4 5)),
      0,
      'Element 1 is at index 0 in array [1, 2, 3, 4, 5]'
   );

   is(
      Example::binary_search('f', qw(a b c d e f g h i)),
      5,
      "Element f is at index 5 in array ['a','b','c','d','e','f','g','h']"
   );
}

{ # does not find missing elements

   is(
      Example::binary_search(1, qw(3 4 5 6 7)),
      -1,
      'Element 1 is not in array [3,4,5,6,7]'
   );

   is(
      Example::binary_search('a', qw(d e f g h i)),
      -1,
      "Element 'a' is not in array ['d','e','f','g','h','i']"
   );
}

{ # phone-book example
  # numbers and names are parrallel arrays that model a phone book
   my @numbers = qw(0407806797 0684947123 1079943381 1185607368 1434201509 1688514914 2114575657 2114986442 2243518982 2352008489 2502008897 2585763976 2968294610 3224727681 3435565486 3477995368 3698166412 3721685899 3923488029 4249932791 4448688880 4616016449 4619411328 4983884178 5254396673 5299517105 5481666467 5707852858 6190903072 6213954897 6654597812 6804362713 6815481586 6906511863 6924155360 7023698560 7107821578 7143580478 7151514144 7362592053 7867168451 8297108636 8454698650 8549803216 8701423878 9305289274 9540085452 9595200548 9734664447 9909223246);
   my @names   = qw(Alta Amanda Amy Andres Andy Angeles Anissa Becky Belinda Bree Brenton Brianne Carla Claudio Colton Consuela Contessa Dacia Darleen Divina Domenic Evelin Evia Georgine Hal Hana Harris Hollie Jeneva Johnette Julietta Kaley Karl Kristian Kyla Kyoko Larhonda Laverne Marcene Marcia Marylin Michelle Ranae Rossie Rubye Rupert Somer Steffanie Tanika Valerie);

   is(
      $numbers[Example::binary_search('Carla', @names)],
      '2968294610',
      'Found correct phone number for Carla'
   );

   is(
      $numbers[Example::binary_search('Alta', @names)],
      '0407806797',
      'Found correct phone number for Alta'
   );

   is(
      Example::binary_search('Aizen', @names),
      -1,
      'Did not find number for \'Aizen\''
   );
}

