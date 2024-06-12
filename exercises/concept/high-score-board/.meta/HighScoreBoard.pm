package HighScoreBoard;

use v5.40;

our %Scores;

sub set_player_scores (%new_scores) {
    %Scores = ( %Scores, %new_scores );
    return;
}

sub get_player_score ($player) {
    return $Scores{$player};
}

sub increase_player_scores (%additional_scores) {
    %Scores = map { $_ => $Scores{$_} + $additional_scores{$_} } keys %Scores;
    return;
}

sub sort_players_by_name {
    return sort keys %Scores;
}

sub sort_players_by_score {
    return sort { $Scores{$b} <=> $Scores{$a} } keys %Scores;
}

sub delete_player ($player) {
    delete $Scores{$player};
    return;
}
