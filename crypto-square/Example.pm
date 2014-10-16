package Example;

use strict;
use warnings;
use POSIX qw(fmod ceil);

sub new {
    my ($class, $plaintext) = @_;
    return bless { plaintext => $plaintext } => $class;
}

sub normalize_plaintext {
    my $self = shift;
    my $normalized = lc $self->{plaintext}; 
    $normalized =~ s/[^0-9a-zA-Z]//g;

    return $normalized;
}

sub size {
    my $self = shift;
    my $size = @_ > 0 ? sqrt(length $_[0]) : sqrt(length $self->normalize_plaintext);

    return  int($size) if fmod($size, 1) == 0;
    return ceil($size);
}

sub normalize_ciphertext {
    my $self = shift;
    my $cipher = $self->ciphertext;
    my $size = $self->size($cipher);

    return join qq{ } => unpack "(A$size)*", $cipher;
}

sub ciphertext {
    my $self = shift;
    my $plaintext_segments = $self->plaintext_segments;
    my $cipher;
    
    no warnings ('uninitialized', 'substr');
    foreach my $index (0..@$plaintext_segments) {
        foreach my $seg ( @$plaintext_segments ) {
           $cipher .= substr $seg, $index, 1;
        }
    }

    return $cipher;
}

sub plaintext_segments {
    my $self = shift;
    return $self->_segmentize($self->normalize_plaintext, $self->size);           
}

sub _segmentize {
    my ($self, $to_segment, $size) = @_;
    my ($segment, @segments) = ('', );

    foreach my $c (split // => $to_segment) {
         do { push @segments => $segment; $segment = '' } if length $segment == $size;
         $segment .= $c;
    }
    push @segments => $segment if $segment;

    return \@segments;
}

__PACKAGE__;
