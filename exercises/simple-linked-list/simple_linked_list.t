#!/usr/bin/env perl
use strict;
use warnings;

use Test::More tests => 14;
use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

my $module = 'LinkedList';

use_ok($module) or BAIL_OUT("You need to create a module called $module.pm");

foreach my $f (qw/new from_array to_array next reverse data/ ) {
    can_ok($module, $f) or BAIL_OUT("You need to implement the function '$f'");
}

sub elem { $module->new( @_ ) }
sub array { $module->from_array( [@_] ) }

subtest 'Tested new()' => sub {
    plan tests => 1;

    isa_ok( elem(1), $module, "return value of new()" );    
};

subtest 'Tested data()' => sub {
    plan tests => 1;

    is( elem(42)->data(), 42, "element returns the correct data" );
};

subtest 'Tested next()' => sub {
    plan tests => 3;

    my $two = elem(2);
    my $one = elem(1, $two);
    
    is( $one->data(), 1, "first element is 1" );
    is( $one->next(), $two, "next is two" );
    is( $one->next()->data(), 2, "two is 2" );
};

subtest 'Tested from_array()' => sub {
    plan tests => 7;

    is( array(), undef, "from_array creates nothing from nothing" );

    my $one = array(1);
    is( $one->data(), 1, "from_array with 1 element" );
    is( $one->next(), undef, "only one element was created" );

    my $e = array(1..5);
    is( $e->data(), 1, "first element is 1" );
    is( $e->next()->data(), 2, "second element is 2" );

    my $five = $e->next()->next()->next()->next();
    is( $five->data(), 5, "fifth element is 5" );
    is( $five->next(), undef, "fifth element is the last element" );
};

subtest 'Tested to_array()' => sub {
    plan tests => 3;

    is_deeply( array(1)->to_array(), [1], "to_array on a one element list" );
    is_deeply( elem(2, array(1))->to_array(), [2,1], "to_array on 2 element-list" );
    is_deeply( array(1..10)->to_array(), [1..10], "to_array() works" );
};

subtest 'Tested reverse()' => sub {
    plan tests => 3;

    is( array(1)->reverse()->data(), 1, "reverse of single element" );
    is( array(1..10)->reverse()->data(), 10, "reverse of large list, first element is last element" );
    is_deeply( array(1..10)->reverse()->to_array(), [reverse 1..10], "all elements reversed" );
};

subtest 'Tested all the things!' => sub {
    plan tests => 1;

    is_deeply( array(1..10)->reverse()->reverse()->to_array(), [1..10], "double reverse" );
};
