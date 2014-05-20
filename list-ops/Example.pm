package Example;

use strict;
use warnings; 

sub map { 
   my ($func, @list) = @_;

   my @result; 
   foreach my $elem (@list) {
      push @result,
         $func->($elem);
   }

   return @result; 
}

sub reduce {
   my ($func, $head, @tail) = @_;

   my $result = $head;
   foreach my $elem (@tail) {
      $result = $func->($result, $elem);
   }

   return $result;
}

sub length {
   my @l = @_; 
   
   return _length(\@l, 0);
}

sub _length {
   my ($list, $n) = @_; 

   return _length($list, $n + 1) 
      if shift @$list;
   
   return $n;
}

1;
