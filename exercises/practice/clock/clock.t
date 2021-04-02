#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Clock ();
use List::Util qw(any);

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };
plan 4;

can_ok 'Clock', qw<new time add_minutes subtract_minutes> or bail_out;

subtest create => sub {
  plan 20;
  for my $case ( grep { $_->{property} eq 'create' } @test_cases ) {
    is(
      Clock->new( $case->{input} ),
      object {
        prop blessed => 'Clock';
        call time    => $case->{expected};
      },
      $case->{description}
    );
  }
};

subtest 'add/subtract' => sub {
  plan 16;
  for my $case (
    grep {
      my $prop = $_->{property};
      any { $prop eq $_ } qw< add subtract >;
    } @test_cases
    )
  {
    is(
      Clock->new(
        { hour   => $case->{input}{hour},
          minute => $case->{input}{minute},
        }
      ),

      # Check that the add/subtract_minutes methods
      # return a Clock object with the correct time
      object {
        call [ $case->{property} . '_minutes',
          $case->{input}{value} ] => object {
          prop blessed => 'Clock';
          call time    => $case->{expected};
          };
      },
      $case->{description}
    );
  }
};

subtest equal => sub {
  plan 16;
  for my $case ( grep { $_->{property} eq 'equal' } @test_cases ) {
    my ( $clock1, $clock2 )
      = ( map { Clock->new($_) }
        @{ $case->{input} }{qw<clock1 clock2>} );
    if ( $case->{expected} ) {
      is $clock1, $clock2, $case->{description};
    }
    else {
      isnt $clock1, $clock2, $case->{description};
    }
  }
};

__DATA__
[
  {
    "description": "Create a new clock with an initial time: on the hour",
    "expected": "08:00",
    "input": {
      "hour": 8,
      "minute": 0
    },
    "property": "create"
  },
  {
    "description": "Create a new clock with an initial time: past the hour",
    "expected": "11:09",
    "input": {
      "hour": 11,
      "minute": 9
    },
    "property": "create"
  },
  {
    "description": "Create a new clock with an initial time: midnight is zero hours",
    "expected": "00:00",
    "input": {
      "hour": 24,
      "minute": 0
    },
    "property": "create"
  },
  {
    "description": "Create a new clock with an initial time: hour rolls over",
    "expected": "01:00",
    "input": {
      "hour": 25,
      "minute": 0
    },
    "property": "create"
  },
  {
    "description": "Create a new clock with an initial time: hour rolls over continuously",
    "expected": "04:00",
    "input": {
      "hour": 100,
      "minute": 0
    },
    "property": "create"
  },
  {
    "description": "Create a new clock with an initial time: sixty minutes is next hour",
    "expected": "02:00",
    "input": {
      "hour": 1,
      "minute": 60
    },
    "property": "create"
  },
  {
    "description": "Create a new clock with an initial time: minutes roll over",
    "expected": "02:40",
    "input": {
      "hour": 0,
      "minute": 160
    },
    "property": "create"
  },
  {
    "description": "Create a new clock with an initial time: minutes roll over continuously",
    "expected": "04:43",
    "input": {
      "hour": 0,
      "minute": 1723
    },
    "property": "create"
  },
  {
    "description": "Create a new clock with an initial time: hour and minutes roll over",
    "expected": "03:40",
    "input": {
      "hour": 25,
      "minute": 160
    },
    "property": "create"
  },
  {
    "description": "Create a new clock with an initial time: hour and minutes roll over continuously",
    "expected": "11:01",
    "input": {
      "hour": 201,
      "minute": 3001
    },
    "property": "create"
  },
  {
    "description": "Create a new clock with an initial time: hour and minutes roll over to exactly midnight",
    "expected": "00:00",
    "input": {
      "hour": 72,
      "minute": 8640
    },
    "property": "create"
  },
  {
    "description": "Create a new clock with an initial time: negative hour",
    "expected": "23:15",
    "input": {
      "hour": -1,
      "minute": 15
    },
    "property": "create"
  },
  {
    "description": "Create a new clock with an initial time: negative hour rolls over",
    "expected": "23:00",
    "input": {
      "hour": -25,
      "minute": 0
    },
    "property": "create"
  },
  {
    "description": "Create a new clock with an initial time: negative hour rolls over continuously",
    "expected": "05:00",
    "input": {
      "hour": -91,
      "minute": 0
    },
    "property": "create"
  },
  {
    "description": "Create a new clock with an initial time: negative minutes",
    "expected": "00:20",
    "input": {
      "hour": 1,
      "minute": -40
    },
    "property": "create"
  },
  {
    "description": "Create a new clock with an initial time: negative minutes roll over",
    "expected": "22:20",
    "input": {
      "hour": 1,
      "minute": -160
    },
    "property": "create"
  },
  {
    "description": "Create a new clock with an initial time: negative minutes roll over continuously",
    "expected": "16:40",
    "input": {
      "hour": 1,
      "minute": -4820
    },
    "property": "create"
  },
  {
    "description": "Create a new clock with an initial time: negative sixty minutes is previous hour",
    "expected": "01:00",
    "input": {
      "hour": 2,
      "minute": -60
    },
    "property": "create"
  },
  {
    "description": "Create a new clock with an initial time: negative hour and minutes both roll over",
    "expected": "20:20",
    "input": {
      "hour": -25,
      "minute": -160
    },
    "property": "create"
  },
  {
    "description": "Create a new clock with an initial time: negative hour and minutes both roll over continuously",
    "expected": "22:10",
    "input": {
      "hour": -121,
      "minute": -5810
    },
    "property": "create"
  },
  {
    "description": "Add minutes: add minutes",
    "expected": "10:03",
    "input": {
      "hour": 10,
      "minute": 0,
      "value": 3
    },
    "property": "add"
  },
  {
    "description": "Add minutes: add no minutes",
    "expected": "06:41",
    "input": {
      "hour": 6,
      "minute": 41,
      "value": 0
    },
    "property": "add"
  },
  {
    "description": "Add minutes: add to next hour",
    "expected": "01:25",
    "input": {
      "hour": 0,
      "minute": 45,
      "value": 40
    },
    "property": "add"
  },
  {
    "description": "Add minutes: add more than one hour",
    "expected": "11:01",
    "input": {
      "hour": 10,
      "minute": 0,
      "value": 61
    },
    "property": "add"
  },
  {
    "description": "Add minutes: add more than two hours with carry",
    "expected": "03:25",
    "input": {
      "hour": 0,
      "minute": 45,
      "value": 160
    },
    "property": "add"
  },
  {
    "description": "Add minutes: add across midnight",
    "expected": "00:01",
    "input": {
      "hour": 23,
      "minute": 59,
      "value": 2
    },
    "property": "add"
  },
  {
    "description": "Add minutes: add more than one day (1500 min = 25 hrs)",
    "expected": "06:32",
    "input": {
      "hour": 5,
      "minute": 32,
      "value": 1500
    },
    "property": "add"
  },
  {
    "description": "Add minutes: add more than two days",
    "expected": "11:21",
    "input": {
      "hour": 1,
      "minute": 1,
      "value": 3500
    },
    "property": "add"
  },
  {
    "description": "Subtract minutes: subtract minutes",
    "expected": "10:00",
    "input": {
      "hour": 10,
      "minute": 3,
      "value": 3
    },
    "property": "subtract"
  },
  {
    "description": "Subtract minutes: subtract to previous hour",
    "expected": "09:33",
    "input": {
      "hour": 10,
      "minute": 3,
      "value": 30
    },
    "property": "subtract"
  },
  {
    "description": "Subtract minutes: subtract more than an hour",
    "expected": "08:53",
    "input": {
      "hour": 10,
      "minute": 3,
      "value": 70
    },
    "property": "subtract"
  },
  {
    "description": "Subtract minutes: subtract across midnight",
    "expected": "23:59",
    "input": {
      "hour": 0,
      "minute": 3,
      "value": 4
    },
    "property": "subtract"
  },
  {
    "description": "Subtract minutes: subtract more than two hours",
    "expected": "21:20",
    "input": {
      "hour": 0,
      "minute": 0,
      "value": 160
    },
    "property": "subtract"
  },
  {
    "description": "Subtract minutes: subtract more than two hours with borrow",
    "expected": "03:35",
    "input": {
      "hour": 6,
      "minute": 15,
      "value": 160
    },
    "property": "subtract"
  },
  {
    "description": "Subtract minutes: subtract more than one day (1500 min = 25 hrs)",
    "expected": "04:32",
    "input": {
      "hour": 5,
      "minute": 32,
      "value": 1500
    },
    "property": "subtract"
  },
  {
    "description": "Subtract minutes: subtract more than two days",
    "expected": "00:20",
    "input": {
      "hour": 2,
      "minute": 20,
      "value": 3000
    },
    "property": "subtract"
  },
  {
    "description": "Compare two clocks for equality: clocks with same time",
    "expected": true,
    "input": {
      "clock1": {
        "hour": 15,
        "minute": 37
      },
      "clock2": {
        "hour": 15,
        "minute": 37
      }
    },
    "property": "equal"
  },
  {
    "description": "Compare two clocks for equality: clocks a minute apart",
    "expected": false,
    "input": {
      "clock1": {
        "hour": 15,
        "minute": 36
      },
      "clock2": {
        "hour": 15,
        "minute": 37
      }
    },
    "property": "equal"
  },
  {
    "description": "Compare two clocks for equality: clocks an hour apart",
    "expected": false,
    "input": {
      "clock1": {
        "hour": 14,
        "minute": 37
      },
      "clock2": {
        "hour": 15,
        "minute": 37
      }
    },
    "property": "equal"
  },
  {
    "description": "Compare two clocks for equality: clocks with hour overflow",
    "expected": true,
    "input": {
      "clock1": {
        "hour": 10,
        "minute": 37
      },
      "clock2": {
        "hour": 34,
        "minute": 37
      }
    },
    "property": "equal"
  },
  {
    "description": "Compare two clocks for equality: clocks with hour overflow by several days",
    "expected": true,
    "input": {
      "clock1": {
        "hour": 3,
        "minute": 11
      },
      "clock2": {
        "hour": 99,
        "minute": 11
      }
    },
    "property": "equal"
  },
  {
    "description": "Compare two clocks for equality: clocks with negative hour",
    "expected": true,
    "input": {
      "clock1": {
        "hour": 22,
        "minute": 40
      },
      "clock2": {
        "hour": -2,
        "minute": 40
      }
    },
    "property": "equal"
  },
  {
    "description": "Compare two clocks for equality: clocks with negative hour that wraps",
    "expected": true,
    "input": {
      "clock1": {
        "hour": 17,
        "minute": 3
      },
      "clock2": {
        "hour": -31,
        "minute": 3
      }
    },
    "property": "equal"
  },
  {
    "description": "Compare two clocks for equality: clocks with negative hour that wraps multiple times",
    "expected": true,
    "input": {
      "clock1": {
        "hour": 13,
        "minute": 49
      },
      "clock2": {
        "hour": -83,
        "minute": 49
      }
    },
    "property": "equal"
  },
  {
    "description": "Compare two clocks for equality: clocks with minute overflow",
    "expected": true,
    "input": {
      "clock1": {
        "hour": 0,
        "minute": 1
      },
      "clock2": {
        "hour": 0,
        "minute": 1441
      }
    },
    "property": "equal"
  },
  {
    "description": "Compare two clocks for equality: clocks with minute overflow by several days",
    "expected": true,
    "input": {
      "clock1": {
        "hour": 2,
        "minute": 2
      },
      "clock2": {
        "hour": 2,
        "minute": 4322
      }
    },
    "property": "equal"
  },
  {
    "description": "Compare two clocks for equality: clocks with negative minute",
    "expected": true,
    "input": {
      "clock1": {
        "hour": 2,
        "minute": 40
      },
      "clock2": {
        "hour": 3,
        "minute": -20
      }
    },
    "property": "equal"
  },
  {
    "description": "Compare two clocks for equality: clocks with negative minute that wraps",
    "expected": true,
    "input": {
      "clock1": {
        "hour": 4,
        "minute": 10
      },
      "clock2": {
        "hour": 5,
        "minute": -1490
      }
    },
    "property": "equal"
  },
  {
    "description": "Compare two clocks for equality: clocks with negative minute that wraps multiple times",
    "expected": true,
    "input": {
      "clock1": {
        "hour": 6,
        "minute": 15
      },
      "clock2": {
        "hour": 6,
        "minute": -4305
      }
    },
    "property": "equal"
  },
  {
    "description": "Compare two clocks for equality: clocks with negative hours and minutes",
    "expected": true,
    "input": {
      "clock1": {
        "hour": 7,
        "minute": 32
      },
      "clock2": {
        "hour": -12,
        "minute": -268
      }
    },
    "property": "equal"
  },
  {
    "description": "Compare two clocks for equality: clocks with negative hours and minutes that wrap",
    "expected": true,
    "input": {
      "clock1": {
        "hour": 18,
        "minute": 7
      },
      "clock2": {
        "hour": -54,
        "minute": -11513
      }
    },
    "property": "equal"
  },
  {
    "description": "Compare two clocks for equality: full clock and zeroed clock",
    "expected": true,
    "input": {
      "clock1": {
        "hour": 24,
        "minute": 0
      },
      "clock2": {
        "hour": 0,
        "minute": 0
      }
    },
    "property": "equal"
  }
]
