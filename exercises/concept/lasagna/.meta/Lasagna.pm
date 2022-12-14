package Lasagna;

use v5.36;

our $EXPECTED_MINUTES_IN_OVEN = 40;

sub remaining_minutes_in_oven ($actual_minutes_in_oven) {
    return $EXPECTED_MINUTES_IN_OVEN - $actual_minutes_in_oven;
}

sub preparation_time_in_minutes ($number_of_layers) {
    return $number_of_layers * 2;
}

sub total_time_in_minutes ($number_of_layers, $actual_minutes_in_oven) {
    return preparation_time_in_minutes($number_of_layers) + $actual_minutes_in_oven;
}

sub alarm () {
    return 'Ding!';
}

1;
