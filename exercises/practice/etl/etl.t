#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use ETL qw<transform>;

imported_ok qw<transform> or bail_out;

is( transform( { 1 => ["A"] } ), { a => 1 }, "single letter", );

is( transform( { 1 => [ "A", "E", "I", "O", "U" ] } ),
    { a => 1, e => 1, i => 1, o => 1, u => 1 },
    "single score with multiple letters",
);

is( transform( { 1 => [ "A", "E" ], 2 => [ "D", "G" ] } ),
    { a => 1, d => 2, e => 1, g => 2 },
    "multiple scores with multiple letters",
);

is( transform(
        {   1  => [ "A", "E", "I", "O", "U", "L", "N", "R", "S", "T" ],
            10 => [ "Q", "Z" ],
            2  => [ "D", "G" ],
            3  => [ "B", "C", "M", "P" ],
            4  => [ "F", "H", "V", "W", "Y" ],
            5  => ["K"],
            8  => [ "J", "X" ]
        }
    ),
    {   a => 1,
        b => 3,
        c => 3,
        d => 2,
        e => 1,
        f => 4,
        g => 2,
        h => 4,
        i => 1,
        j => 8,
        k => 5,
        l => 1,
        m => 3,
        n => 1,
        o => 1,
        p => 3,
        q => 10,
        r => 1,
        s => 1,
        t => 1,
        u => 1,
        v => 4,
        w => 4,
        x => 8,
        y => 4,
        z => 10
    },
    "multiple scores with differing numbers of letters",
);

done_testing;
