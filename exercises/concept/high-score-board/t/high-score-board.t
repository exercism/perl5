#!/usr/bin/env perl

use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use HighScoreBoard ();

subtest 'set_player_scores(%new_scores)' => sub { # begin: set task: 1
    is(
        \%HighScoreBoard::Scores,
        {},
        'The %Scores hash is empty',
    );

    HighScoreBoard::set_player_scores( Alice => 10 );
    is(
        \%HighScoreBoard::Scores,
        { Alice => 10 },
        'Add Alice to the board',
    );

    HighScoreBoard::set_player_scores( Bob => 5 );
    is(
        \%HighScoreBoard::Scores,
        { Alice => 10, Bob => 5 },
        'Add Bob to the board',
    );

    HighScoreBoard::set_player_scores( Alice => 15 );
    is(
        \%HighScoreBoard::Scores,
        { Alice => 15, Bob => 5 },
        "Change Alice's score",
    );

    HighScoreBoard::set_player_scores( Bob => 25, Charlie => 20 );
    is(
        \%HighScoreBoard::Scores,
        { Alice => 15, Bob => 25, Charlie => 20 },
        "Change Bob's score and add Charlie to the board",
    );

    undef %HighScoreBoard::Scores;
}; # end: set

subtest 'get_player_score($player)' => sub { # begin: get task: 2
    %HighScoreBoard::Scores = ( Alice => 15, Bob => 25, Charlie => 20 );

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

    undef %HighScoreBoard::Scores;
}; # end: get

subtest 'increase_player_scores(%additional_scores)' => sub { # begin: increase task: 3
    %HighScoreBoard::Scores = ( Alice => 15, Bob => 25, Charlie => 20 );

    HighScoreBoard::increase_player_scores( Alice => 5 );
    is(
        \%HighScoreBoard::Scores,
        { Alice => 20, Bob => 25, Charlie => 20 },
        "Increase Alice's score",
    );

    HighScoreBoard::increase_player_scores( Charlie => 15 );
    is(
        \%HighScoreBoard::Scores,
        { Alice => 20, Bob => 25, Charlie => 35 },
        "Increase Charlie's score",
    );

    HighScoreBoard::increase_player_scores( Alice => 15, Bob => 10 );
    is(
        \%HighScoreBoard::Scores,
        { Alice => 35, Bob => 35, Charlie => 35 },
        'Increase multiple scores',
    );

    undef %HighScoreBoard::Scores;
}; # end: increase

subtest 'sort_players_by_name()' => sub { # begin: sort_name task: 4
    %HighScoreBoard::Scores = ( Alice => 15, Bob => 25, Charlie => 20, David => 30, Eve => 10 );

    is(
        [ HighScoreBoard::sort_players_by_name() ],
        [qw<Alice Bob Charlie David Eve>],
        'Sort players by name',
    );

    %HighScoreBoard::Scores = ( Fred => 15, George => 25, Harry => 20, Ingrid => 30, John => 10 );
    is(
        [ HighScoreBoard::sort_players_by_name() ],
        [qw<Fred George Harry Ingrid John>],
        'Sort more players by name',
    );

    undef %HighScoreBoard::Scores;
}; # end: sort_name

subtest 'sort_players_by_score()' => sub { # begin: sort_score task: 5
    %HighScoreBoard::Scores = ( Alice => 15, Bob => 25, Charlie => 20, David => 30, Eve => 35 );

    is(
        [ HighScoreBoard::sort_players_by_score() ],
        [qw<Eve David Bob Charlie Alice>],
        'Sort players by score',
    );

    %HighScoreBoard::Scores = ( Fred => 15, George => 25, Harry => 20, Ingrid => 30, John => 10 );
    is(
        [ HighScoreBoard::sort_players_by_score() ],
        [qw<Ingrid George Harry Fred John>],
        'Sort more players by score',
    );

    undef %HighScoreBoard::Scores;
}; # end: sort_score

subtest 'delete_player($name)' => sub { # begin: delete task: 6
    %HighScoreBoard::Scores = ( Alice => 15, Bob => 25, Charlie => 20 );

    HighScoreBoard::delete_player('Bob');
    is(
        \%HighScoreBoard::Scores,
        { Alice => 15, Charlie => 20 },
        'Delete Bob from the board',
    );

    HighScoreBoard::delete_player('Alice');
    is(
        \%HighScoreBoard::Scores,
        { Charlie => 20 },
        'Delete Alice from the board',
    );

    undef %HighScoreBoard::Scores;
}; # end: delete

done_testing;
