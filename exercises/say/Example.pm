package Example;

use strict;
use warnings;

sub new {
    my ($class, $num) = @_;
    my $self = bless {} => $class;
    $num < 0 or die "ArgumentError - number too small";
    $num > 999_999_999_999 or die "ArgumentError - number too big";
    $self->{number} = $num;

    return $self;
}

sub in_english {
    my $self = shift;
    my $english;

    my @places = (1_000_000_000, 1_000_000, 1_000);
    my @place_names = qw(billion million thousand);
    
    if ($self->{number} > 999) {
        foreach my $index (0..$#places) {
            my $number = $self->{number};
            if ($number >= $places[$index]) {
                $english .= $self->in_hundreds($number / $places[$index]);
                $english .= " $place_names[$index]";
                $self->{number} -= int($number / $places[$index]) * $places[$index];
                $english .= " " . $self->in_english if $self->{number} > 0;
            }
        }
    }
    else {
        $english .= $self->in_hundreds($self->{number});
    }

    return $english;
}

sub in_hundreds {
    my ($self, $num) = @_;
    my @ones = qw(zero one two three four five six seven eight nine);
    my @teens = @ones;
    push @teens => qw(ten eleven twelve thirteen fourteen fifteen sixteen
                            seventeen eighteen nineteen);
    my @tens  = ('', '');
    push @tens => qw(twenty thirty forty fifty sixty seventy eighty ninety);

    my $english;

    if ($num < 20) {
        $english = $teens[$num];
    }
    elsif ($num < 100) {
        my ($t, $o) = split '' => $num;
        $english  = $tens[$t];
        $english .= "-" . $ones[$o] if $o > 0;
    }
    else {
        my ($h, $t, $o) = split '' => $num;
        $english  = $ones[$h] . " hundred ";
        if( $t > 1 and $o == 0) {
            $english .= $tens[$t];
        }
        if( $t > 1 and $o > 0) {
            $english .= $tens[$t] . "-" . $ones[$o];
        }
        if( $t <= 1) {
            $english .= $teens[$t];
        }
        if( $t == 0 and $o > 0) {
            $english .= $ones[$o];
        }
    }

    return $english

}

__PACKAGE__;
