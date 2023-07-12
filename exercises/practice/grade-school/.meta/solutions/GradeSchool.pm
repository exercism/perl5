package GradeSchool;

use Moo;
use feature      qw<say>;
use experimental qw<signatures postderef postderef_qq>;

has grades => (
    is      => 'rwp',
    default => sub { {} },
);

sub add {
    my ( $self, $student, $grade ) = @_;
    my %grades   = %{ $self->grades // {} };
    my %students = map {
        map { $_ => 1 } @{$_}
    } values %grades;

    if ( $students{$student} ) {
        return 0;
    }

    $grades{$grade} = [ sort @{ $grades{$grade} // [] }, $student ];
    $self->_set_grades( {%grades} );

    return 1;
}

sub roster {
    my ( $self, $grade ) = @_;
    if ( defined $grade ) {
        return $self->grades->{$grade} // [];
    }
    return [ map { @{ $self->grades->{$_} } }
            sort( keys %{ $self->grades } ) ];
}

1;
