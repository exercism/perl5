package GradeSchool;

use Moo;
use experimental qw<signatures postderef postderef_qq>;

has grades => (
    is      => 'rwp',
    default => sub { {} },
);

sub add ( $self, $student, $grade ) {
    my %grades   = %{ $self->grades // {} };
    my %students = map { map { $_ => 1 } @{$_} } values %grades;

    if ( $students{$student} ) {
        return 0;
    }

    $grades{$grade} = [ sort @{ $grades{$grade} // [] }, $student ];
    $self->_set_grades( {%grades} );

    return 1;
}

sub roster ( $self, $grade = undef ) {
    if ( defined $grade ) {
        return $self->grades->{$grade} // [];
    }
    return [ map { @{ $self->grades->{$_} } } sort( keys %{ $self->grades } ) ];
}

1;
