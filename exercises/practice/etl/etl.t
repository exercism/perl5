#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use ETL qw<transform>;

is(
    transform(
        {
            1 => ["A"]
        }
    ),
    hash {
        field a => 1;
        end;
    },
    "single letter",
);

is(
    transform(
        {
            1 => [ "A", "E", "I", "O", "U" ]
        }
    ),
    hash {
        field a => 1;
        field e => 1;
        field i => 1;
        field o => 1;
        field u => 1;
        end;
    },
    "single score with multiple letters",
);

is(
    transform(
        {
            1 => [ "A", "E" ],
            2 => [ "D", "G" ]
        }
    ),
    hash {
        field a => 1;
        field d => 2;
        field e => 1;
        field g => 2;
        end;
    },
    "multiple scores with multiple letters",
);

is(
    transform(
        {
            1  => [ "A", "E", "I", "O", "U", "L", "N", "R", "S", "T" ],
            10 => [ "Q", "Z" ],
            2  => [ "D", "G" ],
            3  => [ "B", "C", "M", "P" ],
            4  => [ "F", "H", "V", "W", "Y" ],
            5  => ["K"],
            8  => [ "J", "X" ]
        }
    ),
    hash {
        field a => 1;
        field b => 3;
        field c => 3;
        field d => 2;
        field e => 1;
        field f => 4;
        field g => 2;
        field h => 4;
        field i => 1;
        field j => 8;
        field k => 5;
        field l => 1;
        field m => 3;
        field n => 1;
        field o => 1;
        field p => 3;
        field q => 10;
        field r => 1;
        field s => 1;
        field t => 1;
        field u => 1;
        field v => 4;
        field w => 4;
        field x => 8;
        field y => 4;
        field z => 10;
        end;
    },
    "multiple scores with differing numbers of letters",
);

done_testing;
