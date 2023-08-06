#!/usr/bin/env perl

use v5.38;
use Test2::V0;

use HighScoreBoard ();

subtest 'set_player_scores()' => sub {
    HighScoreBoard::set_player_scores(Alice => 10);
    is(
        \%HighScoreBoard::Scores,
        { Alice => 10 },
        'Add Alice to the board',
    );

    HighScoreBoard::set_player_scores(Bob => 5);
    is(
        \%HighScoreBoard::Scores,
        { Alice => 10, Bob => 5 },
        'Add Bob to the board',
    );

    HighScoreBoard::set_player_scores(Alice => 15);
    is(
        \%HighScoreBoard::Scores,
        { Alice => 15, Bob => 5 },
        "Update Alice's score",
    );

    HighScoreBoard::set_player_scores(Bob => 25, Charlie => 20);
    is(
        \%HighScoreBoard::Scores,
        { Alice => 15, Bob => 25, Charlie => 20 },
        "Update Bob's score and add Charlie to the board",
    );
};

subtest 'get_player_score()' => sub {
    is(
        HighScoreBoard::get_player_score('Alice'),
        15,
        "Get Alice's score",
    );

    is(
        HighScoreBoard::get_player_score('Bob'),
        25,
        "Get Bob's score",
    );

    is(
        HighScoreBoard::get_player_score('Charlie'),
        20,
        "Get Charlie's score",
    );
};

done_testing;
