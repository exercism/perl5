#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use CustomSet ();

can_ok 'CustomSet',
    qw<is_empty contains is_subset_of is_disjoint_of is_equal_to add intersection difference union>
    or bail_out;

my ( $set1, $set2 );

$set1 = CustomSet->new( elements => [] );
is(
    $set1->is_empty,
    T,
    "Returns true if the set contains no elements: sets with no elements are empty",
);

$set1 = CustomSet->new( elements => [1] );
is(
    $set1->is_empty,
    DF,
    "Returns true if the set contains no elements: sets with elements are not empty",
);

$set1 = CustomSet->new( elements => [] );
is(
    $set1->contains(1),
    DF,
    "Sets can report if they contain an element: nothing is contained in an empty set",
);

$set1 = CustomSet->new( elements => [ 1, 2, 3 ] );
is(
    $set1->contains(1),
    T,
    "Sets can report if they contain an element: when the element is in the set",
);

$set1 = CustomSet->new( elements => [ 1, 2, 3 ] );
is(
    $set1->contains(4),
    DF,
    "Sets can report if they contain an element: when the element is not in the set",
);

$set1 = CustomSet->new( elements => [] );
$set2 = CustomSet->new( elements => [] );
is(
    $set1->is_subset_of($set2),
    T,
    "A set is a subset if all of its elements are contained in the other set: empty set is a subset of another empty set",
);

$set1 = CustomSet->new( elements => [] );
$set2 = CustomSet->new( elements => [1] );
is(
    $set1->is_subset_of($set2),
    T,
    "A set is a subset if all of its elements are contained in the other set: empty set is a subset of non-empty set",
);

$set1 = CustomSet->new( elements => [1] );
$set2 = CustomSet->new( elements => [] );
is(
    $set1->is_subset_of($set2),
    DF,
    "A set is a subset if all of its elements are contained in the other set: non-empty set is not a subset of empty set",
);

$set1 = CustomSet->new( elements => [ 1, 2, 3 ] );
$set2 = CustomSet->new( elements => [ 1, 2, 3 ] );
is(
    $set1->is_subset_of($set2),
    T,
    "A set is a subset if all of its elements are contained in the other set: set is a subset of set with exact same elements",
);

$set1 = CustomSet->new( elements => [ 1, 2, 3 ] );
$set2 = CustomSet->new( elements => [ 4, 1, 2, 3 ] );
is(
    $set1->is_subset_of($set2),
    T,
    "A set is a subset if all of its elements are contained in the other set: set is a subset of larger set with same elements",
);

$set1 = CustomSet->new( elements => [ 1, 2, 3 ] );
$set2 = CustomSet->new( elements => [ 4, 1, 3 ] );
is(
    $set1->is_subset_of($set2),
    DF,
    "A set is a subset if all of its elements are contained in the other set: set is not a subset of set that does not contain its elements",
);

$set1 = CustomSet->new( elements => [] );
$set2 = CustomSet->new( elements => [] );
is(
    $set1->is_disjoint_of($set2),
    T,
    "Sets are disjoint if they share no elements: the empty set is disjoint with itself",
);

$set1 = CustomSet->new( elements => [] );
$set2 = CustomSet->new( elements => [1] );
is(
    $set1->is_disjoint_of($set2),
    T,
    "Sets are disjoint if they share no elements: empty set is disjoint with non-empty set",
);

$set1 = CustomSet->new( elements => [1] );
$set2 = CustomSet->new( elements => [] );
is(
    $set1->is_disjoint_of($set2),
    T,
    "Sets are disjoint if they share no elements: non-empty set is disjoint with empty set",
);

$set1 = CustomSet->new( elements => [ 1, 2 ] );
$set2 = CustomSet->new( elements => [ 2, 3 ] );
is(
    $set1->is_disjoint_of($set2),
    DF,
    "Sets are disjoint if they share no elements: sets are not disjoint if they share an element",
);

$set1 = CustomSet->new( elements => [ 1, 2 ] );
$set2 = CustomSet->new( elements => [ 3, 4 ] );
is(
    $set1->is_disjoint_of($set2),
    T,
    "Sets are disjoint if they share no elements: sets are disjoint if they share no elements",
);

$set1 = CustomSet->new( elements => [] );
$set2 = CustomSet->new( elements => [] );
is(
    $set1->is_equal_to($set2),
    T,
    "Sets with the same elements are equal: empty sets are equal",
);

$set1 = CustomSet->new( elements => [] );
$set2 = CustomSet->new( elements => [ 1, 2, 3 ] );
is(
    $set1->is_equal_to($set2),
    DF,
    "Sets with the same elements are equal: empty set is not equal to non-empty set",
);

$set1 = CustomSet->new( elements => [ 1, 2, 3 ] );
$set2 = CustomSet->new( elements => [] );
is(
    $set1->is_equal_to($set2),
    DF,
    "Sets with the same elements are equal: non-empty set is not equal to empty set",
);

$set1 = CustomSet->new( elements => [ 1, 2 ] );
$set2 = CustomSet->new( elements => [ 2, 1 ] );
is(
    $set1->is_equal_to($set2),
    T,
    "Sets with the same elements are equal: sets with the same elements are equal",
);

$set1 = CustomSet->new( elements => [ 1, 2, 3 ] );
$set2 = CustomSet->new( elements => [ 1, 2, 4 ] );
is(
    $set1->is_equal_to($set2),
    DF,
    "Sets with the same elements are equal: sets with different elements are not equal",
);

$set1 = CustomSet->new( elements => [ 1, 2, 3 ] );
$set2 = CustomSet->new( elements => [ 1, 2, 3, 4 ] );
is(
    $set1->is_equal_to($set2),
    DF,
    "Sets with the same elements are equal: set is not equal to larger set with same elements",
);

$set1 = CustomSet->new( elements => [] )->add(3);
is(
    $set1->is_equal_to( CustomSet->new( elements => [3] ) ),
    T,
    "Unique elements can be added to a set: add to empty set",
);

$set1 = CustomSet->new( elements => [ 1, 2, 4 ] )->add(3);
is(
    $set1->is_equal_to( CustomSet->new( elements => [ 1, 2, 3, 4 ] ) ),
    T,
    "Unique elements can be added to a set: add to non-empty set",
);

$set1 = CustomSet->new( elements => [ 1, 2, 3 ] )->add(3);
is(
    $set1->is_equal_to( CustomSet->new( elements => [ 1, 2, 3 ] ) ),
    T,
    "Unique elements can be added to a set: adding an existing element does not change the set",
);

$set1 = CustomSet->new( elements => [] );
$set2 = CustomSet->new( elements => [] );
is(
    $set1->intersection($set2)
        ->is_equal_to( CustomSet->new( elements => [] ) ),
    T,
    "Intersection returns a set of all shared elements: intersection of two empty sets is an empty set",
);

$set1 = CustomSet->new( elements => [] );
$set2 = CustomSet->new( elements => [ 3, 2, 5 ] );
is(
    $set1->intersection($set2)
        ->is_equal_to( CustomSet->new( elements => [] ) ),
    T,
    "Intersection returns a set of all shared elements: intersection of an empty set and non-empty set is an empty set",
);

$set1 = CustomSet->new( elements => [ 1, 2, 3, 4 ] );
$set2 = CustomSet->new( elements => [] );
is(
    $set1->intersection($set2)
        ->is_equal_to( CustomSet->new( elements => [] ) ),
    T,
    "Intersection returns a set of all shared elements: intersection of a non-empty set and an empty set is an empty set",
);

$set1 = CustomSet->new( elements => [ 1, 2, 3 ] );
$set2 = CustomSet->new( elements => [ 4, 5, 6 ] );
is(
    $set1->intersection($set2)
        ->is_equal_to( CustomSet->new( elements => [] ) ),
    T,
    "Intersection returns a set of all shared elements: intersection of two sets with no shared elements is an empty set",
);

$set1 = CustomSet->new( elements => [ 1, 2, 3, 4 ] );
$set2 = CustomSet->new( elements => [ 3, 2, 5 ] );
is(
    $set1->intersection($set2)
        ->is_equal_to( CustomSet->new( elements => [ 2, 3 ] ) ),
    T,
    "Intersection returns a set of all shared elements: intersection of two sets with shared elements is a set of the shared elements",
);

$set1 = CustomSet->new( elements => [] );
$set2 = CustomSet->new( elements => [] );
is(
    $set1->difference($set2)->is_equal_to( CustomSet->new( elements => [] ) ),
    T,
    "Difference (or Complement) of a set is a set of all elements that are only in the first set: difference of two empty sets is an empty set",
);

$set1 = CustomSet->new( elements => [] );
$set2 = CustomSet->new( elements => [ 3, 2, 5 ] );
is(
    $set1->difference($set2)->is_equal_to( CustomSet->new( elements => [] ) ),
    T,
    "Difference (or Complement) of a set is a set of all elements that are only in the first set: difference of empty set and non-empty set is an empty set",
);

$set1 = CustomSet->new( elements => [ 1, 2, 3, 4 ] );
$set2 = CustomSet->new( elements => [] );
is(
    $set1->difference($set2)
        ->is_equal_to( CustomSet->new( elements => [ 1, 2, 3, 4 ] ) ),
    T,
    "Difference (or Complement) of a set is a set of all elements that are only in the first set: difference of a non-empty set and an empty set is the non-empty set",
);

$set1 = CustomSet->new( elements => [ 3, 2, 1 ] );
$set2 = CustomSet->new( elements => [ 2, 4 ] );
is(
    $set1->difference($set2)
        ->is_equal_to( CustomSet->new( elements => [ 1, 3 ] ) ),
    T,
    "Difference (or Complement) of a set is a set of all elements that are only in the first set: difference of two non-empty sets is a set of elements that are only in the first set",
);

$set1 = CustomSet->new( elements => [] );
$set2 = CustomSet->new( elements => [] );
is(
    $set1->union($set2)->is_equal_to( CustomSet->new( elements => [] ) ),
    T,
    "Union returns a set of all elements in either set: union of empty sets is an empty set",
);

$set1 = CustomSet->new( elements => [] );
$set2 = CustomSet->new( elements => [2] );
is(
    $set1->union($set2)->is_equal_to( CustomSet->new( elements => [2] ) ),
    T,
    "Union returns a set of all elements in either set: union of an empty set and non-empty set is the non-empty set",
);

$set1 = CustomSet->new( elements => [ 1, 3 ] );
$set2 = CustomSet->new( elements => [] );
is(
    $set1->union($set2)
        ->is_equal_to( CustomSet->new( elements => [ 1, 3 ] ) ),
    T,
    "Union returns a set of all elements in either set: union of a non-empty set and empty set is the non-empty set",
);

$set1 = CustomSet->new( elements => [ 1, 3 ] );
$set2 = CustomSet->new( elements => [ 2, 3 ] );
is(
    $set1->union($set2)
        ->is_equal_to( CustomSet->new( elements => [ 3, 2, 1 ] ) ),
    T,
    "Union returns a set of all elements in either set: union of non-empty sets contains all unique elements",
);

done_testing;
