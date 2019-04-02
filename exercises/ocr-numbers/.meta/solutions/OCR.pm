package OCR;

use strict;
use warnings;

sub new {
  my ( $class, $ocr ) = @_;
  my $self = bless {} => $class;

  $self->_create_ocr_rows($ocr);
  $self->_create_list_table;

  return $self;
}

sub convert {
  my $self = shift;
  my @numbers;

  foreach my $ocr ( @{ $self->{ocr_rows} } ) {
    push @numbers => $self->_convert_row($ocr);
  }

  return join "," => @numbers;
}

sub _convert_row {
  my ( $self, $ocr ) = @_;
  my @ocrs = $self->_list_ocr($ocr);
  my $number;

  foreach my $i ( 0 .. $#ocrs ) {
    my $is_garbled = 1;
    foreach my $j ( 0 .. $#{ $self->{list} } ) {
      if ( $ocrs[$i] eq $self->{list}->[$j] ) {
        $number .= $j;
        $is_garbled = 0;
        last;
      }
    }
    $number .= '?' if $is_garbled;
  }

  return $number;
}

sub _list_ocr {
  my ( $self, $ocr_str ) = @_;
  my @lines = split '\n', $ocr_str;
  my @ocrs;
  my $len   = length $lines[0];
  my $index = 0;

  while ( $index < $len ) {
    $ocrs[ $index / 3 ] = join "\n" => ( map { substr( $lines[$_], $index, 3 ) } 0 .. 3 );

    $index += 3;
  }
  return @ocrs;
}

sub _create_list_table {
  my $self = shift;
  my $all;
  chomp( $all = <<'ALL');
 _     _  _     _  _  _  _  _ 
| |  | _| _||_||_ |_   ||_||_|
|_|  ||_  _|  | _||_|  ||_| _|
                              
ALL
  $self->{list} = [ $self->_list_ocr($all) ];
}

sub _create_ocr_rows {
  my ( $self, $ocr_str ) = @_;
  my @ocrs    = split '\n', $ocr_str;
  my @indexes = grep { $_ % 4 == 0 } 0 .. $#ocrs;

  foreach my $i (@indexes) {
    push @{ $self->{ocr_rows} } => join "\n", @ocrs[ $i .. ( $i + 3 ) ];
  }
}

1;
