package Example;

use strict;
use warnings;

sub new {
    my $class = shift;
    bless {data => shift, next => shift}, $class;
}

sub next :method { $_[0]->{next} }
sub data         { $_[0]->{data} }

sub from_array {
    my( $pkg, $array ) = @_;

    my $head;
    map { $head = __PACKAGE__->new($_, $head) } reverse @$array;
    return $head;
}

sub to_array {
    my $self = shift;
    
    my @array;
    do { push @array, $self->data() } while( $self = $self->next() );
    return \@array;
}

sub reverse :method {
    my $self = shift;

    my $array = $self->to_array();
    @$array = reverse @$array;

    __PACKAGE__->from_array( $array  );
}

1;

