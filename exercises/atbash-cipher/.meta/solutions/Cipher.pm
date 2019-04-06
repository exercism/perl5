package Cipher;

use strict;
use warnings;

sub encode {
  my $plaintext = shift;

  # normalize
  ( my $cipher = $plaintext ) =~ s/[^\p{Alnum}]//g;
  $cipher = lc $cipher;

  # translate
  $cipher =~ tr/abcdefghijklmnopqrstuvwxyz/zyxwvutsrqponmlkjihgfedcba/;

  # wordify
  $cipher =~ s/(\p{Alnum}{5})(?=\p{Alnum})/$1 /g;

  return $cipher;
}

sub decode {
  my $cipher = shift;

  ( my $plaintext = $cipher ) =~ s/[^\p{Alnum}]//g;
  $plaintext =~ tr/zyxwvutsrqponmlkjihgfedcba/abcdefghijklmnopqrstuvwxyz/;

  return $plaintext;
}

__PACKAGE__;
