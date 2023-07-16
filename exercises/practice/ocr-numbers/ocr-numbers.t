#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use OCRNumbers qw<convert_ocr>;

imported_ok qw<convert_ocr> or bail_out;

is( # begin: 5ee54e1a-b554-4bf3-a056-9a7976c3f7e8
    convert_ocr( <<'OCR' =~ s/\n\z//r ),
 _ 
| |
|_|
   
OCR
    0,
    "Recognizes 0",
); # end: 5ee54e1a-b554-4bf3-a056-9a7976c3f7e8

is( # begin: 027ada25-17fd-4d78-aee6-35a19623639d
    convert_ocr( <<'OCR' =~ s/\n\z//r ),
   
  |
  |
   
OCR
    1,
    "Recognizes 1",
); # end: 027ada25-17fd-4d78-aee6-35a19623639d

is( # begin: 3cce2dbd-01d9-4f94-8fae-419a822e89bb
    convert_ocr( <<'OCR' =~ s/\n\z//r ),
   
  _
  |
   
OCR
    "?",
    "Unreadable but correctly sized inputs return ?",
); # end: 3cce2dbd-01d9-4f94-8fae-419a822e89bb

like( # begin: cb19b733-4e36-4cf9-a4a1-6e6aac808b9a
    dies( sub { convert_ocr( <<'OCR' =~ s/\n\z//r ) } ),
 _ 
| |
   
OCR
    qr/Number of input lines is not a multiple of four/,
    "Input with a number of lines that is not a multiple of four raises an error",
); # end: cb19b733-4e36-4cf9-a4a1-6e6aac808b9a

like( # begin: 235f7bd1-991b-4587-98d4-84206eec4cc6
    dies( sub { convert_ocr( <<'OCR' =~ s/\n\z//r ) } ),
    
   |
   |
    
OCR
    qr/Number of input columns is not a multiple of three/,
    "Input with a number of columns that is not a multiple of three raises an error",
); # end: 235f7bd1-991b-4587-98d4-84206eec4cc6

is( # begin: 4a841794-73c9-4da9-a779-1f9837faff66
    convert_ocr( <<'OCR' =~ s/\n\z//r ),
       _     _        _  _ 
  |  || |  || |  |  || || |
  |  ||_|  ||_|  |  ||_||_|
                           
OCR
    110101100,
    "Recognizes 110101100",
); # end: 4a841794-73c9-4da9-a779-1f9837faff66

is( # begin: 70c338f9-85b1-4296-a3a8-122901cdfde8
    convert_ocr( <<'OCR' =~ s/\n\z//r ),
       _     _           _ 
  |  || |  || |     || || |
  |  | _|  ||_|  |  ||_||_|
                           
OCR
    "11?10?1?0",
    "Garbled numbers in a string are replaced with ?",
); # end: 70c338f9-85b1-4296-a3a8-122901cdfde8

is( # begin: ea494ff4-3610-44d7-ab7e-72fdef0e0802
    convert_ocr( <<'OCR' =~ s/\n\z//r ),
 _ 
 _|
|_ 
   
OCR
    2,
    "Recognizes 2",
); # end: ea494ff4-3610-44d7-ab7e-72fdef0e0802

is( # begin: 1acd2c00-412b-4268-93c2-bd7ff8e05a2c
    convert_ocr( <<'OCR' =~ s/\n\z//r ),
 _ 
 _|
 _|
   
OCR
    3,
    "Recognizes 3",
); # end: 1acd2c00-412b-4268-93c2-bd7ff8e05a2c

is( # begin: eaec6a15-be17-4b6d-b895-596fae5d1329
    convert_ocr( <<'OCR' =~ s/\n\z//r ),
   
|_|
  |
   
OCR
    4,
    "Recognizes 4",
); # end: eaec6a15-be17-4b6d-b895-596fae5d1329

is( # begin: 440f397a-f046-4243-a6ca-81ab5406c56e
    convert_ocr( <<'OCR' =~ s/\n\z//r ),
 _ 
|_ 
 _|
   
OCR
    5,
    "Recognizes 5",
); # end: 440f397a-f046-4243-a6ca-81ab5406c56e

is( # begin: f4c9cf6a-f1e2-4878-bfc3-9b85b657caa0
    convert_ocr( <<'OCR' =~ s/\n\z//r ),
 _ 
|_ 
|_|
   
OCR
    6,
    "Recognizes 6",
); # end: f4c9cf6a-f1e2-4878-bfc3-9b85b657caa0

is( # begin: e24ebf80-c611-41bb-a25a-ac2c0f232df5
    convert_ocr( <<'OCR' =~ s/\n\z//r ),
 _ 
  |
  |
   
OCR
    7,
    "Recognizes 7",
); # end: e24ebf80-c611-41bb-a25a-ac2c0f232df5

is( # begin: b79cad4f-e264-4818-9d9e-77766792e233
    convert_ocr( <<'OCR' =~ s/\n\z//r ),
 _ 
|_|
|_|
   
OCR
    8,
    "Recognizes 8",
); # end: b79cad4f-e264-4818-9d9e-77766792e233

is( # begin: 5efc9cfc-9227-4688-b77d-845049299e66
    convert_ocr( <<'OCR' =~ s/\n\z//r ),
 _ 
|_|
 _|
   
OCR
    9,
    "Recognizes 9",
); # end: 5efc9cfc-9227-4688-b77d-845049299e66

is( # begin: f60cb04a-42be-494e-a535-3451c8e097a4
    convert_ocr( <<'OCR' =~ s/\n\z//r ),
    _  _     _  _  _  _  _  _ 
  | _| _||_||_ |_   ||_||_|| |
  ||_  _|  | _||_|  ||_| _||_|
                              
OCR
    1234567890,
    "Recognizes string of decimal numbers",
); # end: f60cb04a-42be-494e-a535-3451c8e097a4

is( # begin: b73ecf8b-4423-4b36-860d-3710bdb8a491
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
); # end: b73ecf8b-4423-4b36-860d-3710bdb8a491

done_testing;
