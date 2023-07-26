#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use OCRNumbers qw<convert_ocr>;

is(
    convert_ocr( <<'OCR' =~ s/\n\z//r ),
 _ 
| |
|_|
   
OCR
    0,
    "Recognizes 0",
);

is(
    convert_ocr( <<'OCR' =~ s/\n\z//r ),
   
  |
  |
   
OCR
    1,
    "Recognizes 1",
);

is(
    convert_ocr( <<'OCR' =~ s/\n\z//r ),
   
  _
  |
   
OCR
    "?",
    "Unreadable but correctly sized inputs return ?",
);

like(
    dies( sub { convert_ocr( <<'OCR' =~ s/\n\z//r ) } ),
 _ 
| |
   
OCR
    qr/Number of input lines is not a multiple of four/,
    "Input with a number of lines that is not a multiple of four raises an error",
);

like(
    dies( sub { convert_ocr( <<'OCR' =~ s/\n\z//r ) } ),
    
   |
   |
    
OCR
    qr/Number of input columns is not a multiple of three/,
    "Input with a number of columns that is not a multiple of three raises an error",
);

is(
    convert_ocr( <<'OCR' =~ s/\n\z//r ),
       _     _        _  _ 
  |  || |  || |  |  || || |
  |  ||_|  ||_|  |  ||_||_|
                           
OCR
    110101100,
    "Recognizes 110101100",
);

is(
    convert_ocr( <<'OCR' =~ s/\n\z//r ),
       _     _           _ 
  |  || |  || |     || || |
  |  | _|  ||_|  |  ||_||_|
                           
OCR
    "11?10?1?0",
    "Garbled numbers in a string are replaced with ?",
);

is(
    convert_ocr( <<'OCR' =~ s/\n\z//r ),
 _ 
 _|
|_ 
   
OCR
    2,
    "Recognizes 2",
);

is(
    convert_ocr( <<'OCR' =~ s/\n\z//r ),
 _ 
 _|
 _|
   
OCR
    3,
    "Recognizes 3",
);

is(
    convert_ocr( <<'OCR' =~ s/\n\z//r ),
   
|_|
  |
   
OCR
    4,
    "Recognizes 4",
);

is(
    convert_ocr( <<'OCR' =~ s/\n\z//r ),
 _ 
|_ 
 _|
   
OCR
    5,
    "Recognizes 5",
);

is(
    convert_ocr( <<'OCR' =~ s/\n\z//r ),
 _ 
|_ 
|_|
   
OCR
    6,
    "Recognizes 6",
);

is(
    convert_ocr( <<'OCR' =~ s/\n\z//r ),
 _ 
  |
  |
   
OCR
    7,
    "Recognizes 7",
);

is(
    convert_ocr( <<'OCR' =~ s/\n\z//r ),
 _ 
|_|
|_|
   
OCR
    8,
    "Recognizes 8",
);

is(
    convert_ocr( <<'OCR' =~ s/\n\z//r ),
 _ 
|_|
 _|
   
OCR
    9,
    "Recognizes 9",
);

is(
    convert_ocr( <<'OCR' =~ s/\n\z//r ),
    _  _     _  _  _  _  _  _ 
  | _| _||_||_ |_   ||_||_|| |
  ||_  _|  | _||_|  ||_| _||_|
                              
OCR
    1234567890,
    "Recognizes string of decimal numbers",
);

is(
    convert_ocr( <<'OCR' =~ s/\n\z//r ),
    _  _ 
  | _| _|
  ||_  _|
         
    _  _ 
|_||_ |_ 
  | _||_|
         
 _  _  _ 
  ||_||_|
  ||_| _|
         
OCR
    "123,456,789",
    "Numbers separated by empty lines are recognized. Lines are joined by commas.",
);

done_testing;
