package Example;

my @default_students = qw(
   alice bob charlie david
   eve fred ginny harriet
   ileana joseph kincaid larry
);
my @students;

sub new {
    my ($class, $garden, $students) = @_;

    my $self = bless { garden => $garden } => $class;
    @students = $students ? map { lc } sort @$students : @default_students;
    
    return $self;
}

sub _map_garden_students {
    my $self = shift;
    my ($row_top, $row_bot) = split '\n' => $self->{garden};
    my ($offset, $width) = (0, 2);

    foreach my $student (@students) {
        $self->{table}->{$student} .= substr $row_top, $offset, $width;
        $self->{table}->{$student} .= substr $row_bot, $offset, $width;
        $offset += $width;
    }
}

sub _translate {
    my ($self, $student) = @_;

    $self->_map_garden_students;

    my %plants = qw(
        R radishes
        V violets
        C clover
        G grass
    );
    [ map { $plants{$_} } split '' => $self->{table}->{$student} ]
}

sub AUTOLOAD {
    my $sub = our $AUTOLOAD;
    $sub =~ s/.*:://;

    if ( grep { $_ eq $sub } @students ) {
        my $self = shift;
        return $self->_translate($sub);
    }
}

__PACKAGE__;
