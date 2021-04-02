#!/usr/bin/env perl
use lib::gitroot qw<:lib :once>;
use Test2::V0 -target => 'Exercism::Generator';

subtest 'Rendered test files' => sub {
  is new_generator(), object {
    call test => <<~'TEST';
      #!/usr/bin/env perl
      use Test2::V0;

      use FindBin qw<$Bin>;
      use lib $Bin, "$Bin/local/lib/perl5";

      use TestExercise ();

      done_testing;
      TEST
  }, 'No data';

  is new_generator( data => { plan => 1 } ), object {
    call test => <<~'TEST';
      #!/usr/bin/env perl
      use Test2::V0;

      use FindBin qw<$Bin>;
      use lib $Bin, "$Bin/local/lib/perl5";

      use TestExercise ();
      plan 1;
      TEST
  }, 'A plan';

  is new_generator( data => { tests => 'ok 1;' } ), object {
    call test => <<~'TEST';
      #!/usr/bin/env perl
      use Test2::V0;

      use FindBin qw<$Bin>;
      use lib $Bin, "$Bin/local/lib/perl5";

      use TestExercise ();

      ok 1;

      done_testing;
      TEST
  }, 'A test';

  is new_generator( json_tests => '[]' ), object {
    call test => <<~'TEST';
      #!/usr/bin/env perl
      use Test2::V0;
      use JSON::PP;
      use constant JSON => JSON::PP->new;

      use FindBin qw<$Bin>;
      use lib $Bin, "$Bin/local/lib/perl5";

      use TestExercise ();

      my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };

      done_testing;

      __DATA__
      []
      TEST
  }, 'JSON tests';

  is new_generator(
    data       => { tests => 'ok $_ for @test_cases;' },
    json_tests => '[true]',
    ),
    object {
    call test => <<~'TEST';
      #!/usr/bin/env perl
      use Test2::V0;
      use JSON::PP;
      use constant JSON => JSON::PP->new;

      use FindBin qw<$Bin>;
      use lib $Bin, "$Bin/local/lib/perl5";

      use TestExercise ();

      my @test_cases = do { local $/; @{ JSON->decode(<DATA>) }; };

      ok $_ for @test_cases;

      done_testing;

      __DATA__
      [true]
      TEST
    }, 'Tests with JSON';

  is new_generator( data => { subs => 'foo' } ), object {
    call test => <<~'TEST';
      #!/usr/bin/env perl
      use Test2::V0;

      use FindBin qw<$Bin>;
      use lib $Bin, "$Bin/local/lib/perl5";

      use TestExercise qw<foo>;

      imported_ok qw<foo> or bail_out;

      done_testing;
      TEST
  }, 'Subs';

  is new_generator( data => { methods => 'foo' } ), object {
    call test => <<~'TEST';
      #!/usr/bin/env perl
      use Test2::V0;

      use FindBin qw<$Bin>;
      use lib $Bin, "$Bin/local/lib/perl5";

      use TestExercise ();

      can_ok 'TestExercise', qw<foo> or bail_out;

      done_testing;
      TEST
  }, 'Methods';
};

done_testing;

sub new_generator {
  CLASS->new( exercise => 'test-exercise', @_ );
}
