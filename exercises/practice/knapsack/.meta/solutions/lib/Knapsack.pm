package Knapsack;

use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<maximum_value>;

sub maximum_value ( $items, $weight, $offset = 0, $best_score = 0, @indexes ) {

    # Loop through all unchecked combinations of @indexes (the list of
    # items passed from the last level of recursion), plus each of the
    # items which appear later in the array (from the $offset index).
    foreach my $index ( $offset .. $#$items ) {

        # Reset local array of indexes from last loop iteration to that
        # which was passed at the start of this level of recursion.
        my @local_indexes = @indexes;

        # Skip if this item exceeds remaining weight.
        next if ( $items->[$index]->{'weight'} > $weight );

        # Otherwise add item to knapsack
        push( @local_indexes, $index );

        # Calculate sum for new array of indexes
        my $score = 0;
        $score += $items->[$_]->{'value'} foreach @local_indexes;

        # Overwrite $best_score if it has been beaten
        $best_score = $score if ( $score > $best_score );

        # Optimizations: Skip recursion if there is no capacity left
        # or if there would be no additional items to check.
        next if $weight == $items->[$index]->{'weight'};
        next if ( $index == $#$items );

        # Recursively call this function to check the remaining items
        # in combination with the current @local_indexes. Offset the
        # starting index to be the item after this one.
        $best_score = maximum_value(
            $items,
            $weight - $items->[$index]->{'weight'},
            ++$index,
            $best_score,
            @local_indexes
        );
    }
    return $best_score;
}

1;
