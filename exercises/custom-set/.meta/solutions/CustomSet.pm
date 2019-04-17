package CustomSet;
use strict;
use warnings;
use 5.020;
use experimental 'signatures';
use Exporter 'import';
our @EXPORT_OK = qw(
    new add remove is_empty
    is_member size to_list
    union intersect difference
    is_disjoint is_equal is_subset
);

sub new ($class, @members) {
    my %set;
    @set{ @members } = ();
    bless \%set, $class;
}

sub add ($self, $member) {
    $self->{$member} = 1;
    return $self;
}

sub remove ($self, $member) {
    delete $self->{$member};
    return $self;
}

sub is_empty ($self) {
    return !%$self;
}

sub is_member ($self, $member) {
    return exists $self->{$member};
}

sub size ($self) {
    return scalar keys %$self;
}

sub to_list ($self) {
    return keys %$self;
}

sub union ($self, $other) {
    return __PACKAGE__->new( keys %$self, keys %$other );
}

sub intersect ($self, $other) {
    return __PACKAGE__->new( grep { $self->is_member($_) } keys %$other );
}

sub difference ($self, $other) {
    return __PACKAGE__->new( grep { !$other->is_member($_) } keys %$self );
}

sub is_disjoint ($self, $other) {
    return $self->intersect($other)->is_empty;
}

sub is_subset ($self, $other) {
    return $other->difference($self)->is_empty;
}

sub is_equal ($self, $other) {
    return $self->is_subset($other) && $other->is_subset($self);
}

1;



