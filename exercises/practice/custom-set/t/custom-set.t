#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use CustomSet ();

my ( $set1, $set2 );

$set1 = CustomSet->new( elements => [] ); # begin: 20c5f855-f83a-44a7-abdd-fe75c6cf022b
is(
    $set1->is_empty,
    T,
    "Returns true if the set contains no elements: sets with no elements are empty",
); # end: 20c5f855-f83a-44a7-abdd-fe75c6cf022b

$set1 = CustomSet->new( elements => [1] ); # begin: d506485d-5706-40db-b7d8-5ceb5acf88d2
is(
    $set1->is_empty,
    DF,
    "Returns true if the set contains no elements: sets with elements are not empty",
); # end: d506485d-5706-40db-b7d8-5ceb5acf88d2

$set1 = CustomSet->new( elements => [] ); # begin: 759b9740-3417-44c3-8ca3-262b3c281043
is(
    $set1->contains(1),
    DF,
    "Sets can report if they contain an element: nothing is contained in an empty set",
); # end: 759b9740-3417-44c3-8ca3-262b3c281043

$set1 = CustomSet->new( elements => [ 1, 2, 3 ] ); # begin: f83cd2d1-2a85-41bc-b6be-80adbff4be49
is(
    $set1->contains(1),
    T,
    "Sets can report if they contain an element: when the element is in the set",
); # end: f83cd2d1-2a85-41bc-b6be-80adbff4be49

$set1 = CustomSet->new( elements => [ 1, 2, 3 ] ); # begin: 93423fc0-44d0-4bc0-a2ac-376de8d7af34
is(
    $set1->contains(4),
    DF,
    "Sets can report if they contain an element: when the element is not in the set",
); # end: 93423fc0-44d0-4bc0-a2ac-376de8d7af34

$set1 = CustomSet->new( elements => [] ); # begin: c392923a-637b-4495-b28e-34742cd6157a
$set2 = CustomSet->new( elements => [] );
is(
    $set1->is_subset_of($set2),
    T,
    "A set is a subset if all of its elements are contained in the other set: empty set is a subset of another empty set",
); # end: c392923a-637b-4495-b28e-34742cd6157a

$set1 = CustomSet->new( elements => [] ); # begin: 5635b113-be8c-4c6f-b9a9-23c485193917
$set2 = CustomSet->new( elements => [1] );
is(
    $set1->is_subset_of($set2),
    T,
    "A set is a subset if all of its elements are contained in the other set: empty set is a subset of non-empty set",
); # end: 5635b113-be8c-4c6f-b9a9-23c485193917

$set1 = CustomSet->new( elements => [1] ); # begin: 832eda58-6d6e-44e2-92c2-be8cf0173cee
$set2 = CustomSet->new( elements => [] );
is(
    $set1->is_subset_of($set2),
    DF,
    "A set is a subset if all of its elements are contained in the other set: non-empty set is not a subset of empty set",
); # end: 832eda58-6d6e-44e2-92c2-be8cf0173cee

$set1 = CustomSet->new( elements => [ 1, 2, 3 ] ); # begin: c830c578-8f97-4036-b082-89feda876131
$set2 = CustomSet->new( elements => [ 1, 2, 3 ] );
is(
    $set1->is_subset_of($set2),
    T,
    "A set is a subset if all of its elements are contained in the other set: set is a subset of set with exact same elements",
); # end: c830c578-8f97-4036-b082-89feda876131

$set1 = CustomSet->new( elements => [ 1, 2, 3 ] ); # begin: 476a4a1c-0fd1-430f-aa65-5b70cbc810c5
$set2 = CustomSet->new( elements => [ 4, 1, 2, 3 ] );
is(
    $set1->is_subset_of($set2),
    T,
    "A set is a subset if all of its elements are contained in the other set: set is a subset of larger set with same elements",
); # end: 476a4a1c-0fd1-430f-aa65-5b70cbc810c5

$set1 = CustomSet->new( elements => [ 1, 2, 3 ] ); # begin: d2498999-3e46-48e4-9660-1e20c3329d3d
$set2 = CustomSet->new( elements => [ 4, 1, 3 ] );
is(
    $set1->is_subset_of($set2),
    DF,
    "A set is a subset if all of its elements are contained in the other set: set is not a subset of set that does not contain its elements",
); # end: d2498999-3e46-48e4-9660-1e20c3329d3d

$set1 = CustomSet->new( elements => [] ); # begin: 7d38155e-f472-4a7e-9ad8-5c1f8f95e4cc
$set2 = CustomSet->new( elements => [] );
is(
    $set1->is_disjoint_of($set2),
    T,
    "Sets are disjoint if they share no elements: the empty set is disjoint with itself",
); # end: 7d38155e-f472-4a7e-9ad8-5c1f8f95e4cc

$set1 = CustomSet->new( elements => [] ); # begin: 7a2b3938-64b6-4b32-901a-fe16891998a6
$set2 = CustomSet->new( elements => [1] );
is(
    $set1->is_disjoint_of($set2),
    T,
    "Sets are disjoint if they share no elements: empty set is disjoint with non-empty set",
); # end: 7a2b3938-64b6-4b32-901a-fe16891998a6

$set1 = CustomSet->new( elements => [1] ); # begin: 589574a0-8b48-48ea-88b0-b652c5fe476f
$set2 = CustomSet->new( elements => [] );
is(
    $set1->is_disjoint_of($set2),
    T,
    "Sets are disjoint if they share no elements: non-empty set is disjoint with empty set",
); # end: 589574a0-8b48-48ea-88b0-b652c5fe476f

$set1 = CustomSet->new( elements => [ 1, 2 ] ); # begin: febeaf4f-f180-4499-91fa-59165955a523
$set2 = CustomSet->new( elements => [ 2, 3 ] );
is(
    $set1->is_disjoint_of($set2),
    DF,
    "Sets are disjoint if they share no elements: sets are not disjoint if they share an element",
); # end: febeaf4f-f180-4499-91fa-59165955a523

$set1 = CustomSet->new( elements => [ 1, 2 ] ); # begin: 0de20d2f-c952-468a-88c8-5e056740f020
$set2 = CustomSet->new( elements => [ 3, 4 ] );
is(
    $set1->is_disjoint_of($set2),
    T,
    "Sets are disjoint if they share no elements: sets are disjoint if they share no elements",
); # end: 0de20d2f-c952-468a-88c8-5e056740f020

$set1 = CustomSet->new( elements => [] ); # begin: 4bd24adb-45da-4320-9ff6-38c044e9dff8
$set2 = CustomSet->new( elements => [] );
is(
    $set1->is_equal_to($set2),
    T,
    "Sets with the same elements are equal: empty sets are equal",
); # end: 4bd24adb-45da-4320-9ff6-38c044e9dff8

$set1 = CustomSet->new( elements => [] ); # begin: f65c0a0e-6632-4b2d-b82c-b7c6da2ec224
$set2 = CustomSet->new( elements => [ 1, 2, 3 ] );
is(
    $set1->is_equal_to($set2),
    DF,
    "Sets with the same elements are equal: empty set is not equal to non-empty set",
); # end: f65c0a0e-6632-4b2d-b82c-b7c6da2ec224

$set1 = CustomSet->new( elements => [ 1, 2, 3 ] ); # begin: 81e53307-7683-4b1e-a30c-7e49155fe3ca
$set2 = CustomSet->new( elements => [] );
is(
    $set1->is_equal_to($set2),
    DF,
    "Sets with the same elements are equal: non-empty set is not equal to empty set",
); # end: 81e53307-7683-4b1e-a30c-7e49155fe3ca

$set1 = CustomSet->new( elements => [ 1, 2 ] ); # begin: d57c5d7c-a7f3-48cc-a162-6b488c0fbbd0
$set2 = CustomSet->new( elements => [ 2, 1 ] );
is(
    $set1->is_equal_to($set2),
    T,
    "Sets with the same elements are equal: sets with the same elements are equal",
); # end: d57c5d7c-a7f3-48cc-a162-6b488c0fbbd0

$set1 = CustomSet->new( elements => [ 1, 2, 3 ] ); # begin: dd61bafc-6653-42cc-961a-ab071ee0ee85
$set2 = CustomSet->new( elements => [ 1, 2, 4 ] );
is(
    $set1->is_equal_to($set2),
    DF,
    "Sets with the same elements are equal: sets with different elements are not equal",
); # end: dd61bafc-6653-42cc-961a-ab071ee0ee85

$set1 = CustomSet->new( elements => [ 1, 2, 3 ] ); # begin: 06059caf-9bf4-425e-aaff-88966cb3ea14
$set2 = CustomSet->new( elements => [ 1, 2, 3, 4 ] );
is(
    $set1->is_equal_to($set2),
    DF,
    "Sets with the same elements are equal: set is not equal to larger set with same elements",
); # end: 06059caf-9bf4-425e-aaff-88966cb3ea14

$set1 = CustomSet->new( elements => [] )->add(3); # begin: 8a677c3c-a658-4d39-bb88-5b5b1a9659f4
is(
    $set1->is_equal_to( CustomSet->new( elements => [3] ) ),
    T,
    "Unique elements can be added to a set: add to empty set",
); # end: 8a677c3c-a658-4d39-bb88-5b5b1a9659f4

$set1 = CustomSet->new( elements => [ 1, 2, 4 ] )->add(3); # begin: 0903dd45-904d-4cf2-bddd-0905e1a8d125
is(
    $set1->is_equal_to( CustomSet->new( elements => [ 1, 2, 3, 4 ] ) ),
    T,
    "Unique elements can be added to a set: add to non-empty set",
); # end: 0903dd45-904d-4cf2-bddd-0905e1a8d125

$set1 = CustomSet->new( elements => [ 1, 2, 3 ] )->add(3); # begin: b0eb7bb7-5e5d-4733-b582-af771476cb99
is(
    $set1->is_equal_to( CustomSet->new( elements => [ 1, 2, 3 ] ) ),
    T,
    "Unique elements can be added to a set: adding an existing element does not change the set",
); # end: b0eb7bb7-5e5d-4733-b582-af771476cb99

$set1 = CustomSet->new( elements => [] ); # begin: 893d5333-33b8-4151-a3d4-8f273358208a
$set2 = CustomSet->new( elements => [] );
is(
    $set1->intersection($set2)->is_equal_to( CustomSet->new( elements => [] ) ),
    T,
    "Intersection returns a set of all shared elements: intersection of two empty sets is an empty set",
); # end: 893d5333-33b8-4151-a3d4-8f273358208a

$set1 = CustomSet->new( elements => [] ); # begin: d739940e-def2-41ab-a7bb-aaf60f7d782c
$set2 = CustomSet->new( elements => [ 3, 2, 5 ] );
is(
    $set1->intersection($set2)->is_equal_to( CustomSet->new( elements => [] ) ),
    T,
    "Intersection returns a set of all shared elements: intersection of an empty set and non-empty set is an empty set",
); # end: d739940e-def2-41ab-a7bb-aaf60f7d782c

$set1 = CustomSet->new( elements => [ 1, 2, 3, 4 ] ); # begin: 3607d9d8-c895-4d6f-ac16-a14956e0a4b7
$set2 = CustomSet->new( elements => [] );
is(
    $set1->intersection($set2)->is_equal_to( CustomSet->new( elements => [] ) ),
    T,
    "Intersection returns a set of all shared elements: intersection of a non-empty set and an empty set is an empty set",
); # end: 3607d9d8-c895-4d6f-ac16-a14956e0a4b7

$set1 = CustomSet->new( elements => [ 1, 2, 3 ] ); # begin: b5120abf-5b5e-41ab-aede-4de2ad85c34e
$set2 = CustomSet->new( elements => [ 4, 5, 6 ] );
is(
    $set1->intersection($set2)->is_equal_to( CustomSet->new( elements => [] ) ),
    T,
    "Intersection returns a set of all shared elements: intersection of two sets with no shared elements is an empty set",
); # end: b5120abf-5b5e-41ab-aede-4de2ad85c34e

$set1 = CustomSet->new( elements => [ 1, 2, 3, 4 ] ); # begin: af21ca1b-fac9-499c-81c0-92a591653d49
$set2 = CustomSet->new( elements => [ 3, 2, 5 ] );
is(
    $set1->intersection($set2)->is_equal_to( CustomSet->new( elements => [ 2, 3 ] ) ),
    T,
    "Intersection returns a set of all shared elements: intersection of two sets with shared elements is a set of the shared elements",
); # end: af21ca1b-fac9-499c-81c0-92a591653d49

$set1 = CustomSet->new( elements => [] ); # begin: c5e6e2e4-50e9-4bc2-b89f-c518f015b57e
$set2 = CustomSet->new( elements => [] );
is(
    $set1->difference($set2)->is_equal_to( CustomSet->new( elements => [] ) ),
    T,
    "Difference (or Complement) of a set is a set of all elements that are only in the first set: difference of two empty sets is an empty set",
); # end: c5e6e2e4-50e9-4bc2-b89f-c518f015b57e

$set1 = CustomSet->new( elements => [] ); # begin: 2024cc92-5c26-44ed-aafd-e6ca27d6fcd2
$set2 = CustomSet->new( elements => [ 3, 2, 5 ] );
is(
    $set1->difference($set2)->is_equal_to( CustomSet->new( elements => [] ) ),
    T,
    "Difference (or Complement) of a set is a set of all elements that are only in the first set: difference of empty set and non-empty set is an empty set",
); # end: 2024cc92-5c26-44ed-aafd-e6ca27d6fcd2

$set1 = CustomSet->new( elements => [ 1, 2, 3, 4 ] ); # begin: e79edee7-08aa-4c19-9382-f6820974b43e
$set2 = CustomSet->new( elements => [] );
is(
    $set1->difference($set2)->is_equal_to( CustomSet->new( elements => [ 1, 2, 3, 4 ] ) ),
    T,
    "Difference (or Complement) of a set is a set of all elements that are only in the first set: difference of a non-empty set and an empty set is the non-empty set",
); # end: e79edee7-08aa-4c19-9382-f6820974b43e

$set1 = CustomSet->new( elements => [ 3, 2, 1 ] ); # begin: c5ac673e-d707-4db5-8d69-7082c3a5437e
$set2 = CustomSet->new( elements => [ 2, 4 ] );
is(
    $set1->difference($set2)->is_equal_to( CustomSet->new( elements => [ 1, 3 ] ) ),
    T,
    "Difference (or Complement) of a set is a set of all elements that are only in the first set: difference of two non-empty sets is a set of elements that are only in the first set",
); # end: c5ac673e-d707-4db5-8d69-7082c3a5437e

$set1 = CustomSet->new( elements => [] ); # begin: c45aed16-5494-455a-9033-5d4c93589dc6
$set2 = CustomSet->new( elements => [] );
is(
    $set1->union($set2)->is_equal_to( CustomSet->new( elements => [] ) ),
    T,
    "Union returns a set of all elements in either set: union of empty sets is an empty set",
); # end: c45aed16-5494-455a-9033-5d4c93589dc6

$set1 = CustomSet->new( elements => [] ); # begin: 9d258545-33c2-4fcb-a340-9f8aa69e7a41
$set2 = CustomSet->new( elements => [2] );
is(
    $set1->union($set2)->is_equal_to( CustomSet->new( elements => [2] ) ),
    T,
    "Union returns a set of all elements in either set: union of an empty set and non-empty set is the non-empty set",
); # end: 9d258545-33c2-4fcb-a340-9f8aa69e7a41

$set1 = CustomSet->new( elements => [ 1, 3 ] ); # begin: 3aade50c-80c7-4db8-853d-75bac5818b83
$set2 = CustomSet->new( elements => [] );
is(
    $set1->union($set2)->is_equal_to( CustomSet->new( elements => [ 1, 3 ] ) ),
    T,
    "Union returns a set of all elements in either set: union of a non-empty set and empty set is the non-empty set",
); # end: 3aade50c-80c7-4db8-853d-75bac5818b83

$set1 = CustomSet->new( elements => [ 1, 3 ] ); # begin: a00bb91f-c4b4-4844-8f77-c73e2e9df77c
$set2 = CustomSet->new( elements => [ 2, 3 ] );
is(
    $set1->union($set2)->is_equal_to( CustomSet->new( elements => [ 3, 2, 1 ] ) ),
    T,
    "Union returns a set of all elements in either set: union of non-empty sets contains all unique elements",
); # end: a00bb91f-c4b4-4844-8f77-c73e2e9df77c

done_testing;
