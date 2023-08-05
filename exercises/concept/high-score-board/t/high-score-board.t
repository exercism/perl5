#!/usr/bin/env perl

use v5.38;
use Test2::V0;

use HighScoreBoard ();

is( # begin: hash
    \%HighScoreBoard::Scores,
    {},
    '%Scores hash is empty',
); # end: hash

done_testing;
