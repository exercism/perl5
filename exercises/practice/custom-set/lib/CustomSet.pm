use v5.40;
use experimental qw<class>;

class CustomSet;

field $elements : reader : param;

method is_empty () {
    return undef;
}

method contains ($element) {
    return undef;
}

method is_subset_of ($other) {
    return undef;
}

method is_disjoint_of ($other) {
    return undef;
}

method is_equal_to ($other) {
    return undef;
}

method add ($element) {
    return undef;
}

method intersection ($other) {
    return undef;
}

method difference ($other) {
    return undef;
}

method union ($other) {
    return undef;
}

1;
