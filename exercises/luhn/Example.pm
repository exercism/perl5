package Example;

use strict;
use warnings;

use List::Util 'sum';

sub new {
    my ($class, $number) = @_;

    my $self = bless {} => $class;
    $self->{number} = [ split '' => $number ];

    return $self;
}

sub addends {
    my $self = shift;
    my $addends = $self->{number};

    foreach my $index (1..@{$addends}) {
        if ($index  % 2 == 0 and $addends->[-$index] < 5) {
            $addends->[-$index] = $addends->[-$index] * 2;
        }
        elsif ($index  % 2 == 0 and $addends->[-$index] >= 5) {
            $addends->[-$index] = $addends->[-$index] * 2 - 9;
        }
    }
    return $self->{addends} = $addends;

}

sub checksum {
    my $self = shift;
    return sum @{ exists $self->{addends} ? $self->{addends} : $self->addends() };
}

sub is_valid {
    my $self = shift;
    return $self->checksum  % 10 == 0;
}

sub create {
    my $self = shift;
    my $number = join '' => @{$self->{number}};

    # thank you /xpython
    my $luhn = __PACKAGE__->new($number * 10);
    my $diff = (10 - $luhn->checksum) % 10;
    return 10 * $number + $diff;
}

1;
