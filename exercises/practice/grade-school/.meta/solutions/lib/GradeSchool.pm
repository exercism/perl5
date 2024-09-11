use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;
use Feature::Compat::Class;

class GradeSchool;

field %grades;

method add ( $student, $grade ) {
    my %students = map { map { $_ => 1 } @{$_} } values %grades;

    if ( $students{$student} ) {
        return 0;
    }

    $grades{$grade} = [ sort @{ $grades{$grade} // [] }, $student ];

    return 1;
}

method roster ( $grade = undef ) {
    if ( defined $grade ) {
        return $grades{$grade} // [];
    }
    return [ map { @{ $grades{$_} } } sort( keys %grades ) ];
}

1;
