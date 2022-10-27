#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use CustomSet
    qw<is_empty_set set_contains is_subset is_disjoint_set is_equal_set add_set_element set_intersection set_difference set_union>;

imported_ok
    qw<is_empty_set set_contains is_subset is_disjoint_set is_equal_set add_set_element set_intersection set_difference set_union>
    or bail_out;

is( is_empty_set( [] ),
    T,
    "Returns true if the set contains no elements: sets with no elements are empty",
);

is( is_empty_set( [1] ),
    DF,
    "Returns true if the set contains no elements: sets with elements are not empty",
);

is( set_contains( [], 1 ),
    DF,
    "Sets can report if they contain an element: nothing is contained in an empty set",
);

is( set_contains( [ 1, 2, 3 ], 1 ),
    T,
    "Sets can report if they contain an element: when the element is in the set",
);

is( set_contains( [ 1, 2, 3 ], 4 ),
    DF,
    "Sets can report if they contain an element: when the element is not in the set",
);

is( is_subset( [], [] ),
    T,
    "A set is a subset if all of its elements are contained in the other set: empty set is a subset of another empty set",
);

is( is_subset( [], [1] ),
    T,
    "A set is a subset if all of its elements are contained in the other set: empty set is a subset of non-empty set",
);

is( is_subset( [1], [] ),
    DF,
    "A set is a subset if all of its elements are contained in the other set: non-empty set is not a subset of empty set",
);

is( is_subset( [ 1, 2, 3 ], [ 1, 2, 3 ] ),
    T,
    "A set is a subset if all of its elements are contained in the other set: set is a subset of set with exact same elements",
);

is( is_subset( [ 1, 2, 3 ], [ 4, 1, 2, 3 ] ),
    T,
    "A set is a subset if all of its elements are contained in the other set: set is a subset of larger set with same elements",
);

is( is_subset( [ 1, 2, 3 ], [ 4, 1, 3 ] ),
    DF,
    "A set is a subset if all of its elements are contained in the other set: set is not a subset of set that does not contain its elements",
);

is( is_disjoint_set( [], [] ),
    T,
    "Sets are disjoint if they share no elements: the empty set is disjoint with itself",
);

is( is_disjoint_set( [], [1] ),
    T,
    "Sets are disjoint if they share no elements: empty set is disjoint with non-empty set",
);

is( is_disjoint_set( [1], [] ),
    T,
    "Sets are disjoint if they share no elements: non-empty set is disjoint with empty set",
);

is( is_disjoint_set( [ 1, 2 ], [ 2, 3 ] ),
    DF,
    "Sets are disjoint if they share no elements: sets are not disjoint if they share an element",
);

is( is_disjoint_set( [ 1, 2 ], [ 3, 4 ] ),
    T,
    "Sets are disjoint if they share no elements: sets are disjoint if they share no elements",
);

is( is_equal_set( [], [] ),
    T, "Sets with the same elements are equal: empty sets are equal",
);

is( is_equal_set( [], [ 1, 2, 3 ] ),
    DF,
    "Sets with the same elements are equal: empty set is not equal to non-empty set",
);

is( is_equal_set( [ 1, 2, 3 ], [] ),
    DF,
    "Sets with the same elements are equal: non-empty set is not equal to empty set",
);

is( is_equal_set( [ 1, 2 ], [ 2, 1 ] ),
    T,
    "Sets with the same elements are equal: sets with the same elements are equal",
);

is( is_equal_set( [ 1, 2, 3 ], [ 1, 2, 4 ] ),
    DF,
    "Sets with the same elements are equal: sets with different elements are not equal",
);

is( is_equal_set( [ 1, 2, 3 ], [ 1, 2, 3, 4 ] ),
    DF,
    "Sets with the same elements are equal: set is not equal to larger set with same elements",
);

is( add_set_element( [], 3 ),
    bag { item 3; end; },
    "Unique elements can be added to a set: add to empty set",
);

is( add_set_element( [ 1, 2, 4 ], 3 ),
    bag { item 1; item 2; item 3; item 4; end; },
    "Unique elements can be added to a set: add to non-empty set",
);

is( add_set_element( [ 1, 2, 3 ], 3 ),
    bag { item 1; item 2; item 3; end; },
    "Unique elements can be added to a set: adding an existing element does not change the set",
);

is( set_intersection( [], [] ),
    bag { end; },
    "Intersection returns a set of all shared elements: intersection of two empty sets is an empty set",
);

is( set_intersection( [], [ 3, 2, 5 ] ),
    bag { end; },
    "Intersection returns a set of all shared elements: intersection of an empty set and non-empty set is an empty set",
);

is( set_intersection( [ 1, 2, 3, 4 ], [] ),
    bag { end; },
    "Intersection returns a set of all shared elements: intersection of a non-empty set and an empty set is an empty set",
);

is( set_intersection( [ 1, 2, 3 ], [ 4, 5, 6 ] ),
    bag { end; },
    "Intersection returns a set of all shared elements: intersection of two sets with no shared elements is an empty set",
);

is( set_intersection( [ 1, 2, 3, 4 ], [ 3, 2, 5 ] ),
    bag { item 2; item 3; end; },
    "Intersection returns a set of all shared elements: intersection of two sets with shared elements is a set of the shared elements",
);

is( set_difference( [], [] ),
    bag { end; },
    "Difference (or Complement) of a set is a set of all elements that are only in the first set: difference of two empty sets is an empty set",
);

is( set_difference( [], [ 3, 2, 5 ] ),
    bag { end; },
    "Difference (or Complement) of a set is a set of all elements that are only in the first set: difference of empty set and non-empty set is an empty set",
);

is( set_difference( [ 1, 2, 3, 4 ], [] ),
    bag { item 1; item 2; item 3; item 4; end; },
    "Difference (or Complement) of a set is a set of all elements that are only in the first set: difference of a non-empty set and an empty set is the non-empty set",
);

is( set_difference( [ 3, 2, 1 ], [ 2, 4 ] ),
    bag { item 1; item 3; end; },
    "Difference (or Complement) of a set is a set of all elements that are only in the first set: difference of two non-empty sets is a set of elements that are only in the first set",
);

is( set_union( [], [] ),
    bag { end; },
    "Union returns a set of all elements in either set: union of empty sets is an empty set",
);

is( set_union( [], [2] ),
    bag { item 2; end; },
    "Union returns a set of all elements in either set: union of an empty set and non-empty set is the non-empty set",
);

is( set_union( [ 1, 3 ], [] ),
    bag { item 1; item 3; end; },
    "Union returns a set of all elements in either set: union of a non-empty set and empty set is the non-empty set",
);

is( set_union( [ 1, 3 ], [ 2, 3 ] ),
    bag { item 3; item 2; item 1; end; },
    "Union returns a set of all elements in either set: union of non-empty sets contains all unique elements",
);

done_testing;
