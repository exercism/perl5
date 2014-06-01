use strict;
use warnings;

use Test::More tests=> 17;
use Test::Exception;

my $module = $ENV{EXERCISM} ? 'Example' : 'Series';

use_ok($module) or BAIL_OUT("You need to create a module called $module.pm");
can_ok($module, "new") or BAIL_OUT("You need to implement the new(input)-function");
can_ok($module, "slice") or BAIL_OUT("You need to implement the slice(size)-function");

my @cases = ({ name      => "Simple slices of one",
 	       input     => "01234",
	       size      => 1,
	       expected  => [[0], [1], [2], [3], [4]],
	     },
	     { name      => "Simple slices of one - again",
	       input     => "92834",
	       size      => 1,
	       expected  => [[9], [2], [8], [3], [4]],
	     },
	     { name      => "Simple slices of two",
	       input     => "01234",
	       size      => 2,
	       expected  => [[0, 1], [1, 2], [2, 3], [3, 4]],
	     },
	     { name      => "Other slices of two",
	       input     => "98273463",
	       size      => 2,
	       expected  => [[9, 8], [8, 2], [2, 7], [7, 3], [3, 4], [4, 6], [6, 3]],
	     },
	     { name      => "Simple slices of two - again",
	       input     => "37103",
	       size      => 2,
	       expected  => [[3, 7], [7, 1], [1, 0], [0, 3]],
	     },
	     { name      => "Simple slices of three",
	       input     => "01234",
	       size      => 3,
	       expected  => [[0, 1, 2], [1, 2, 3], [2, 3, 4]],
	     },
	     { name      => "Simple slices of three - again",
	       input     => "31001",
	       size      => 3,
	       expected  => [[3, 1, 0], [1, 0, 0], [0, 0, 1]],
	     },
	     { name      => "Other slices of three",
	       input     => "982347",
	       size      => 3,
	       expected  => [[9, 8, 2], [8, 2, 3], [2, 3, 4], [3, 4, 7]],
	     },
	     { name      => "Simple slices of four",
	       input     => "01234",
	       size      => 4,
	       expected  => [[0, 1, 2, 3], [1, 2, 3, 4]],
	     },
	     { name      => "Simple slices of four - again",
	       input     => "91274",
	       size      => 4,
	       expected  => [[9, 1, 2, 7], [1, 2, 7, 4]],
	     },
	     { name      => "Simple slices of five",
	       input     => "01234",
	       size      => 5,
	       expected  => [[0, 1, 2, 3, 4]],
	     },
	     { name      => "Simple slices of five - again",
	       input     => "81228",
	       size      => 5,
	       expected  => [[8, 1, 2, 2, 8]],
	     },
	     { name      => "Simple slice that blows up",
	       input     => "01234",
	       size      => 6,
	       exception => "ArgumentError",
	     },
	     { name      => "More complicated slice that blows up",
	       input     => "01032987583",
	       size      => 12,
	       exception => "ArgumentError",
	     } );
	      
foreach my $case ( @cases ) {
    my $m = $module->new( $case->{input} );
    
    if( $case->{exception} ) {
	throws_ok { $m->slice($case->{size}) } qr/$case->{exception}/, $case->{name};
    } else {
	is_deeply $m->slice($case->{size}), $case->{expected}, $case->{name};
    }
}

