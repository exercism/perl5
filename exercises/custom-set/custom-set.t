#!/usr/bin/env perl
use strict;
use warnings;

use Test::More tests => 27;
use FindBin;
my $dir;
BEGIN { $dir = $FindBin::Bin . '/' };
use lib $dir;

my $module = $ENV{EXERCISM} ? 'Example' : 'CustomSet';

use_ok($module) or BAIL_OUT("You need to create a module called $module.pm");

foreach my $f (qw/new delete difference is_disjoint empty intersect
		  is_member add size is_subset to_list union is_equal/) {
    can_ok($module, $f) or BAIL_OUT("You need to implement the function '$f'");
}

sub set { return $module->new(@_) };

subtest 'Tested new()' => sub {
    plan tests => 1;

    isa_ok( $module->new(), $module, "return value of new()" );
};

subtest 'Tested equal()' => sub {
    plan tests => 6;

    ok( set(1,3)->is_equal( set(3,1) ), "order doesn't matter" );
    ok( set()->is_equal( set() ), "empty sets are equal" );
    ok( ! set(1..3)->is_equal( set(3..5) ), "different sets are not equal" );
    ok( ! set()->is_equal( set(1..3) ), "empty set is not equal to non-empty set" );
    ok( ! set(1..3)->is_equal( set() ), "non-empty set is not equal to empty set" );
    ok( ! set(1..4)->is_equal( set(3..6) ), "partial subsets are not equal" );
};

subtest 'Tested intersect()' => sub {
    plan tests => 7;

    isa_ok( set()->intersect( set() ), $module, "return value of intersect()" );
    ok( set(1..10)->intersect( set(5..10) )->is_equal( set(5..10) ), "intersect with subset returns subset" );
    ok( set(3..6)->intersect( set(5..8) )->is_equal( set(5,6) ), "intersect non-subset" );
    ok( set(1..3)->intersect( set(4..6) )->is_equal( set() ), "nothing in common" );
    ok( set(1,3,5,7,9)->intersect( set(3..7) )->is_equal( set(3,5,7) ), "intersect with odd numbers" );
    ok( set()->intersect( set() )->is_equal( set() ), "an empty set is an empty set" );
    ok( set(1..3)->intersect( set(3) )->is_equal( set(3) ), "Intersect with unary set results in unary set" );  
};

subtest 'Tested delete()' => sub {
    plan tests => 3;

    isa_ok( set(3,2,1)->delete(2), $module, "return value of delete()" );
    ok( set(3,2,1)->delete(2)->is_equal( set(1,3) ), "removing single element" );
    ok( set(3,2,1)->delete(4)->is_equal( set(1..3) ), "removing non-existant element" );
};

subtest 'Tested add()' => sub {
    plan tests => 4;

    isa_ok( set()->add(1), $module, "return value of add()" );
    ok( set()->add(1)->is_equal( set(1) ), "adding to empty set" );
    ok( set(1,2,4)->add(3)->is_equal( set(1..4) ), "adding to non-empty set" );
    ok( set(1,2,3)->add(3)->is_equal( set(1..3) ), "adding existing member is noop" );
};

subtest 'Tested difference()' => sub {
    plan tests => 6;

    isa_ok( set()->difference( set() ), $module, "return value of difference()" );
    ok( set()->difference( set() )->is_equal( set() ), "difference of two empty sets is an empty set" );
    ok( set()->difference( set(1..3) )->is_equal( set() ), "difference between empty set and non-empty set" );
    ok( set(1..3)->difference( set() )->is_equal( set(1..3) ), "difference between non-empty set and empty set" );
    ok( set(1,2,3)->difference( set(2,4) )->is_equal( set(1,3) ), "small differemce" );
    ok( set(1..10, 20..30)->difference( set(5..25) )->is_equal( set(1..4, 26..30) ), "large difference" );
};

subtest 'Tested is_disjoint()' => sub {
    plan tests => 5;

    ok( set(1,2)->is_disjoint( set(3,4) ), "disjointed sets are disjoint" );
    ok( ! set(1,2)->is_disjoint( set(2,3) ), "sets sharing elements are not disjoint" );
    ok( set()->is_disjoint( set() ), "empty sets are disjoint" );
    ok( set()->is_disjoint( set(1..3) ), "an empty set is disjoint to a non-empty set" );
    ok( set(1..3)->is_disjoint( set() ), "a non-empty set is disjoint to an empty set" );
};

subtest 'Tested empty()' => sub {
    plan tests => 4;

    isa_ok( set()->empty(), $module, "return value of empty()" );
    ok( set()->empty()->is_equal( set() ), "emptying empty set results in an empty set" );
    ok( set(1..3)->empty()->is_equal( set() ), "set empty after emptying (duh!)" );
    
    my $set = set(1..3);
    $set->empty();
    ok( $set->is_equal( set() ), "not just an empty set returned, but set was emptied" ); 
};

subtest 'Tested is_member()' => sub {
    plan tests => 4;

    ok( set(1,2,3)->is_member(2), "element is member" );
    ok( set(1..10)->is_member(10), "edge element is also member" );
    ok( ! set(1..10)->is_member(11), "element is not member" );
    ok( ! set()->is_member(1), "nothing is member of the empty set" );
};

subtest 'Tested size()' => sub {
    plan tests => 3;

    is( set()->size(), 0, "size of empty set is 0" );
    is( set(1..3)->size(), 3, "size of set with 3 members is 3!" );
    is( set(1,2,3,2)->size(), 3, "size of set with 3 members is still 3!" );
};

subtest 'Tested is_subset()' => sub {
    plan tests => 8;

    ok( set()->is_subset( set() ), "empty set is a subset of the empty set" );
    ok( ! set()->is_subset( set(1..3) ), "non-empty set can not be subset of empty set" );
    ok( set(1..3)->is_subset( set() ), "empty set is a subset of anything" );
    ok( set(1,2,3)->is_subset( set(1,2,3) ), "a set is a subset of itself" );
    ok( set(4,1,2,3)->is_subset( set(1,2,3) ), "a proper subset" );
    ok( ! set(4,1,3)->is_subset( set(1,2,3) ), "same number of elements but not a subset" );
    ok( ! set(2..4)->is_subset( set(1..5) ), "superset is not a subset" );
    ok( ! set(1..10)->is_subset( set(1..3, 11) ), "smaller number of elements but still not a subset" );
};

subtest 'Tested union()' => sub {
    plan tests => 7;
    
    isa_ok( set()->union( set() ), $module, "return value of union()" );
    ok( set()->union( set() )->is_equal( set() ), "union of empty sets is an empty set" );
    ok( set(2)->union( set() )->is_equal( set(2) ), "union of non-empty set and empty set is non-empty set" );
    ok( set()->union( set(2) )->is_equal( set(2) ), "union of empty set and non-empty set is non-empty set" );
    ok( set(1,3)->union( set(3,1) )->is_equal( set(1,3) ), "union with self is self" );
    ok( set(1,3)->union( set(2,4) )->is_equal( set(1..4) ), "small union" );
    ok( set(1..10, 20..30)->union( set(5..25) )->is_equal( set(1..30) ), "large union" );
};

subtest 'Tested to_list()' => sub {
    plan tests => 3;

    is_deeply( [ sort +set()->to_list() ], [], "empty set results in empty list" );
    is_deeply( [ sort +set(1..3)->to_list() ], [1,2,3], "set with elements results in list with elements" );
    is_deeply( [ sort +set(3,1,2,1)->to_list() ], [1,2,3], "set with duplicate elements still results in list with uniq elements" );
};
