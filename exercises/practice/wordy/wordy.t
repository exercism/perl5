#!/usr/bin/env perl
use Test2::V0;
use JSON::PP;
use constant JSON => JSON::PP->new;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Wordy qw<answer>;

my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };

imported_ok qw<answer> or bail_out;

for my $case (@test_cases) {
    if ( !ref $case->{expected} ) {
        is(
            answer( $case->{input}{question} ),
            $case->{expected},
            $case->{description},
        );
    }
    else {
        like dies( sub { answer( $case->{input}{question} ) } ),
            qr/$case->{expected}{error}/, $case->{description};
    }
}

done_testing;

__DATA__
[
  {
    "description": "just a number",
    "expected": 5,
    "input": {
      "question": "What is 5?"
    },
    "property": "answer"
  },
  {
    "description": "addition",
    "expected": 2,
    "input": {
      "question": "What is 1 plus 1?"
    },
    "property": "answer"
  },
  {
    "description": "more addition",
    "expected": 55,
    "input": {
      "question": "What is 53 plus 2?"
    },
    "property": "answer"
  },
  {
    "description": "addition with negative numbers",
    "expected": -11,
    "input": {
      "question": "What is -1 plus -10?"
    },
    "property": "answer"
  },
  {
    "description": "large addition",
    "expected": 45801,
    "input": {
      "question": "What is 123 plus 45678?"
    },
    "property": "answer"
  },
  {
    "description": "subtraction",
    "expected": 16,
    "input": {
      "question": "What is 4 minus -12?"
    },
    "property": "answer"
  },
  {
    "description": "multiplication",
    "expected": -75,
    "input": {
      "question": "What is -3 multiplied by 25?"
    },
    "property": "answer"
  },
  {
    "description": "division",
    "expected": -11,
    "input": {
      "question": "What is 33 divided by -3?"
    },
    "property": "answer"
  },
  {
    "description": "multiple additions",
    "expected": 3,
    "input": {
      "question": "What is 1 plus 1 plus 1?"
    },
    "property": "answer"
  },
  {
    "description": "addition and subtraction",
    "expected": 8,
    "input": {
      "question": "What is 1 plus 5 minus -2?"
    },
    "property": "answer"
  },
  {
    "description": "multiple subtraction",
    "expected": 3,
    "input": {
      "question": "What is 20 minus 4 minus 13?"
    },
    "property": "answer"
  },
  {
    "description": "subtraction then addition",
    "expected": 14,
    "input": {
      "question": "What is 17 minus 6 plus 3?"
    },
    "property": "answer"
  },
  {
    "description": "multiple multiplication",
    "expected": -12,
    "input": {
      "question": "What is 2 multiplied by -2 multiplied by 3?"
    },
    "property": "answer"
  },
  {
    "description": "addition and multiplication",
    "expected": -8,
    "input": {
      "question": "What is -3 plus 7 multiplied by -2?"
    },
    "property": "answer"
  },
  {
    "description": "multiple division",
    "expected": 2,
    "input": {
      "question": "What is -12 divided by 2 divided by -3?"
    },
    "property": "answer"
  },
  {
    "description": "unknown operation",
    "expected": {
      "error": "unknown operation"
    },
    "input": {
      "question": "What is 52 cubed?"
    },
    "property": "answer"
  },
  {
    "description": "Non math question",
    "expected": {
      "error": "unknown operation"
    },
    "input": {
      "question": "Who is the President of the United States?"
    },
    "property": "answer"
  },
  {
    "description": "reject problem missing an operand",
    "expected": {
      "error": "syntax error"
    },
    "input": {
      "question": "What is 1 plus?"
    },
    "property": "answer"
  },
  {
    "description": "reject problem with no operands or operators",
    "expected": {
      "error": "syntax error"
    },
    "input": {
      "question": "What is?"
    },
    "property": "answer"
  },
  {
    "description": "reject two operations in a row",
    "expected": {
      "error": "syntax error"
    },
    "input": {
      "question": "What is 1 plus plus 2?"
    },
    "property": "answer"
  },
  {
    "description": "reject two numbers in a row",
    "expected": {
      "error": "syntax error"
    },
    "input": {
      "question": "What is 1 plus 2 1?"
    },
    "property": "answer"
  },
  {
    "description": "reject postfix notation",
    "expected": {
      "error": "syntax error"
    },
    "input": {
      "question": "What is 1 2 plus?"
    },
    "property": "answer"
  },
  {
    "description": "reject prefix notation",
    "expected": {
      "error": "syntax error"
    },
    "input": {
      "question": "What is plus 1 2?"
    },
    "property": "answer"
  }
]
