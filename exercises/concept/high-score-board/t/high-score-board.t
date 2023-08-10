#!/usr/bin/env perl

use v5.38;
use Test2::V0;

use HighScoreBoard ();

subtest 'set_player_scores()' => sub {
    is(
        \%HighScoreBoard::Scores,
        {},
        'The %Scores hash is empty',
    );

    HighScoreBoard::set_player_scores(Alice => 10);
    is(
        \%HighScoreBoard::Scores,
        { Alice => 10 },
        'set_player_scores() adds Alice to the board',
    );

    HighScoreBoard::set_player_scores(Bob => 5);
    is(
        \%HighScoreBoard::Scores,
        { Alice => 10, Bob => 5 },
        'set_player_scores() adds Bob to the board',
    );

    HighScoreBoard::set_player_scores(Alice => 15);
    is(
        \%HighScoreBoard::Scores,
        { Alice => 15, Bob => 5 },
        "set_player_scores() update Alice's score",
    );

    HighScoreBoard::set_player_scores(Bob => 25, Charlie => 20);
    is(
        \%HighScoreBoard::Scores,
        { Alice => 15, Bob => 25, Charlie => 20 },
        "set_player_scores() updates Bob's score and add Charlie to the board",
    );

    undef %HighScoreBoard::Scores;
};

subtest 'get_player_score()' => sub {
    %HighScoreBoard::Scores = ( Alice => 15, Bob => 25, Charlie => 20 );

    is(
        HighScoreBoard::get_player_score('Alice'),
        15,
        "get_player_score() gets Alice's score",
    );

    is(
        HighScoreBoard::get_player_score('Bob'),
        25,
        "get_player_score() gets Bob's score",
    );

    is(
        HighScoreBoard::get_player_score('Charlie'),
        20,
        "get_player_score() gets Charlie's score",
    );
};

done_testing;
