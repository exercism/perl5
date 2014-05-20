package Example; 

use strict;
use warnings; 

use Scalar::Util qw(looks_like_number); 

=item binary_search

interface for binary search, produces a comparison function
so that binary_search can work on numbers and strings

maintains assertion that the array to search much be sorted in
order for binary_search to work properly

On success: returns the index in the array @A where the value $key was found
On failure: returns undef ( an invalid array index )

=cut

sub binary_search {
   my ($key, $A) = @_; 
   
   my $cmp_func = looks_like_number($key) 
         ? sub { $_[0] <=> $_[1] } 
         : sub { $_[0] cmp $_[1] };

   my @sorted = sort { $cmp_func->($a, $b) } @$A;
   foreach my $i ( 0 .. $#sorted ) {
      die "Binary Search can only be performed on sorted data" 
         unless $cmp_func->($sorted[$i], $A->[$i]) == 0;
   }

   return _binary_search(
      $key, 
      0, 
      scalar @$A - 1, 
      $cmp_func,
      $A
  );
}

sub _binary_search {   
   my ($key, $start, $end, $cmp_func, $A) = @_; 
   
   return undef
      if $start > $end; 

   my $mid = $start + int(($end - $start) / 2);

   my $c = $cmp_func->($A->[$mid], $key); 

   if ( $c > 0 ) {
      return _binary_search($key, $start, $mid - 1, $cmp_func, $A);
   }
   elsif ( $c < 0 ) {
      return _binary_search($key, $mid + 1, $end, $cmp_func, $A);
   }
   else {
      return $mid; 
   }
}

1;

