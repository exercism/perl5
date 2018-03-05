# Declare package 'Bob' with version
package Bob 3;
use strict;
use warnings;

sub hey {
  my ($text) = @_;
  if (uc($text) eq $text && $text =~ /\p{Uppercase}/) {
    return 'Calm down, I know what I\'m doing!' if $text =~ /\?\s*$/;
    return 'Whoa, chill out!';
  }
  return 'Fine. Be that way!' if $text =~ /^\s*$/;
  return 'Sure.' if $text =~ /\?\s*$/;
  return 'Whatever.';
}

1;
