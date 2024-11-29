#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use CircularBuffer ();

subtest reading_empty_buffer_should_fail => sub { # begin: 28268ed4-4ff3-45f3-820e-895b44d53dfa
    my $buff = CircularBuffer->new( capacity => 1 );
    like(
        dies { $buff->read() },
        qr/buffer empty/,
        "check 1"
    );
}; # end: 28268ed4-4ff3-45f3-820e-895b44d53dfa

subtest can_read_an_item_just_written => sub { # begin: 2e6db04a-58a1-425d-ade8-ac30b5f318f3
    my $buff = CircularBuffer->new( capacity => 1 );
    ok( lives { $buff->write(1) }, "check 1" );
    is( $buff->read(), 1, "check 2" );
}; # end: 2e6db04a-58a1-425d-ade8-ac30b5f318f3

subtest each_item_may_only_be_read_once => sub { # begin: 90741fe8-a448-45ce-be2b-de009a24c144
    my $buff = CircularBuffer->new( capacity => 1 );
    ok( lives { $buff->write(1) }, "check 1" );
    is( $buff->read(), 1, "check 2" );
    like(
        dies { $buff->read() },
        qr/buffer empty/,
        "check 3"
    );
}; # end: 90741fe8-a448-45ce-be2b-de009a24c144

subtest items_are_read_in_the_order_they_are_written => sub { # begin: be0e62d5-da9c-47a8-b037-5db21827baa7
    my $buff = CircularBuffer->new( capacity => 2 );
    ok( lives { $buff->write(1) }, "check 1" );
    ok( lives { $buff->write(2) }, "check 2" );
    is( $buff->read(), 1, "check 3" );
    is( $buff->read(), 2, "check 4" );
}; # end: be0e62d5-da9c-47a8-b037-5db21827baa7

subtest full_buffer_cant_be_written_to => sub { # begin: 2af22046-3e44-4235-bfe6-05ba60439d38
    my $buff = CircularBuffer->new( capacity => 1 );
    ok( lives { $buff->write(1) }, "check 1" );
    like(
        dies { $buff->write(2) },
        qr/buffer full/,
        "check 2"
    );
}; # end: 2af22046-3e44-4235-bfe6-05ba60439d38

subtest a_read_frees_up_capacity_for_another_write => sub { # begin: 547d192c-bbf0-4369-b8fa-fc37e71f2393
    my $buff = CircularBuffer->new( capacity => 1 );
    ok( lives { $buff->write(1) }, "check 1" );
    is( $buff->read(), 1, "check 2" );
    ok( lives { $buff->write(2) }, "check 3" );
    is( $buff->read(), 2, "check 4" );
}; # end: 547d192c-bbf0-4369-b8fa-fc37e71f2393

subtest read_position_is_maintained_even_across_multiple_writes => sub { # begin: 04a56659-3a81-4113-816b-6ecb659b4471
    my $buff = CircularBuffer->new( capacity => 3 );
    ok( lives { $buff->write(1) }, "check 1" );
    ok( lives { $buff->write(2) }, "check 2" );
    is( $buff->read(), 1, "check 3" );
    ok( lives { $buff->write(3) }, "check 4" );
    is( $buff->read(), 2, "check 5" );
    is( $buff->read(), 3, "check 6" );
}; # end: 04a56659-3a81-4113-816b-6ecb659b4471

subtest items_cleared_out_of_buffer_cant_be_read => sub { # begin: 60c3a19a-81a7-43d7-bb0a-f07242b1111f
    my $buff = CircularBuffer->new( capacity => 1 );
    ok( lives { $buff->write(1) }, "check 1" );
    ok( lives { $buff->clear() },  "check 2" );
    like(
        dies { $buff->read() },
        qr/buffer empty/,
        "check 3"
    );
}; # end: 60c3a19a-81a7-43d7-bb0a-f07242b1111f

subtest clear_frees_up_capacity_for_another_write => sub { # begin: 45f3ae89-3470-49f3-b50e-362e4b330a59
    my $buff = CircularBuffer->new( capacity => 1 );
    ok( lives { $buff->write(1) }, "check 1" );
    ok( lives { $buff->clear() },  "check 2" );
    ok( lives { $buff->write(2) }, "check 3" );
    is( $buff->read(), 2, "check 4" );
}; # end: 45f3ae89-3470-49f3-b50e-362e4b330a59

subtest clear_does_nothing_on_empty_buffer => sub { # begin: e1ac5170-a026-4725-bfbe-0cf332eddecd
    my $buff = CircularBuffer->new( capacity => 1 );
    ok( lives { $buff->clear() },  "check 1" );
    ok( lives { $buff->write(1) }, "check 2" );
    is( $buff->read(), 1, "check 3" );
}; # end: e1ac5170-a026-4725-bfbe-0cf332eddecd

subtest overwrite_acts_like_write_on_non_full_buffer => sub { # begin: 9c2d4f26-3ec7-453f-a895-7e7ff8ae7b5b
    my $buff = CircularBuffer->new( capacity => 2 );
    ok( lives { $buff->write(1) },     "check 1" );
    ok( lives { $buff->overwrite(2) }, "check 2" );
    is( $buff->read(), 1, "check 3" );
    is( $buff->read(), 2, "check 4" );
}; # end: 9c2d4f26-3ec7-453f-a895-7e7ff8ae7b5b

subtest overwrite_replaces_the_oldest_item_on_full_buffer => sub { # begin: 880f916b-5039-475c-bd5c-83463c36a147
    my $buff = CircularBuffer->new( capacity => 2 );
    ok( lives { $buff->write(1) },     "check 1" );
    ok( lives { $buff->write(2) },     "check 2" );
    ok( lives { $buff->overwrite(3) }, "check 3" );
    is( $buff->read(), 2, "check 4" );
    is( $buff->read(), 3, "check 5" );
}; # end: 880f916b-5039-475c-bd5c-83463c36a147

subtest overwrite_replaces_the_oldest_item_remaining_in_buffer_following_a_read => sub { # begin: bfecab5b-aca1-4fab-a2b0-cd4af2b053c3
    my $buff = CircularBuffer->new( capacity => 3 );
    ok( lives { $buff->write(1) }, "check 1" );
    ok( lives { $buff->write(2) }, "check 2" );
    ok( lives { $buff->write(3) }, "check 3" );
    is( $buff->read(), 1, "check 4" );
    ok( lives { $buff->write(4) },     "check 5" );
    ok( lives { $buff->overwrite(5) }, "check 6" );
    is( $buff->read(), 3, "check 7" );
    is( $buff->read(), 4, "check 8" );
    is( $buff->read(), 5, "check 9" );
}; # end: bfecab5b-aca1-4fab-a2b0-cd4af2b053c3

subtest initial_clear_does_not_affect_wrapping_around => sub { # begin: 9cebe63a-c405-437b-8b62-e3fdc1ecec5a
    my $buff = CircularBuffer->new( capacity => 2 );
    ok( lives { $buff->clear() },      "check 1" );
    ok( lives { $buff->write(1) },     "check 2" );
    ok( lives { $buff->write(2) },     "check 3" );
    ok( lives { $buff->overwrite(3) }, "check 4" );
    ok( lives { $buff->overwrite(4) }, "check 5" );
    is( $buff->read(), 3, "check 6" );
    is( $buff->read(), 4, "check 7" );
    like(
        dies { $buff->read() },
        qr/buffer empty/,
        "check 8"
    );
}; # end: 9cebe63a-c405-437b-8b62-e3fdc1ecec5a

done_testing;
