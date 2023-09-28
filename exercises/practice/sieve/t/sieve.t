#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use Sieve qw<find_primes>;

is( # begin: 88529125-c4ce-43cc-bb36-1eb4ddd7b44f
    find_primes(1),
    [],
    "no primes under two",
); # end: 88529125-c4ce-43cc-bb36-1eb4ddd7b44f

is( # begin: 4afe9474-c705-4477-9923-840e1024cc2b
    find_primes(2),
    [2],
    "find first prime",
); # end: 4afe9474-c705-4477-9923-840e1024cc2b

is( # begin: 974945d8-8cd9-4f00-9463-7d813c7f17b7
    find_primes(10),
    [ 2, 3, 5, 7 ],
    "find primes up to 10",
); # end: 974945d8-8cd9-4f00-9463-7d813c7f17b7

is( # begin: 2e2417b7-3f3a-452a-8594-b9af08af6d82
    find_primes(13),
    [ 2, 3, 5, 7, 11, 13 ],
    "limit is prime",
); # end: 2e2417b7-3f3a-452a-8594-b9af08af6d82

is( # begin: 92102a05-4c7c-47de-9ed0-b7d5fcd00f21
    find_primes(1000),
    array {
        item 2;
        item 3;
        item 5;
        item 7;
        item 11;
        item 13;
        item 17;
        item 19;
        item 23;
        item 29;
        item 31;
        item 37;
        item 41;
        item 43;
        item 47;
        item 53;
        item 59;
        item 61;
        item 67;
        item 71;
        item 73;
        item 79;
        item 83;
        item 89;
        item 97;
        item 101;
        item 103;
        item 107;
        item 109;
        item 113;
        item 127;
        item 131;
        item 137;
        item 139;
        item 149;
        item 151;
        item 157;
        item 163;
        item 167;
        item 173;
        item 179;
        item 181;
        item 191;
        item 193;
        item 197;
        item 199;
        item 211;
        item 223;
        item 227;
        item 229;
        item 233;
        item 239;
        item 241;
        item 251;
        item 257;
        item 263;
        item 269;
        item 271;
        item 277;
        item 281;
        item 283;
        item 293;
        item 307;
        item 311;
        item 313;
        item 317;
        item 331;
        item 337;
        item 347;
        item 349;
        item 353;
        item 359;
        item 367;
        item 373;
        item 379;
        item 383;
        item 389;
        item 397;
        item 401;
        item 409;
        item 419;
        item 421;
        item 431;
        item 433;
        item 439;
        item 443;
        item 449;
        item 457;
        item 461;
        item 463;
        item 467;
        item 479;
        item 487;
        item 491;
        item 499;
        item 503;
        item 509;
        item 521;
        item 523;
        item 541;
        item 547;
        item 557;
        item 563;
        item 569;
        item 571;
        item 577;
        item 587;
        item 593;
        item 599;
        item 601;
        item 607;
        item 613;
        item 617;
        item 619;
        item 631;
        item 641;
        item 643;
        item 647;
        item 653;
        item 659;
        item 661;
        item 673;
        item 677;
        item 683;
        item 691;
        item 701;
        item 709;
        item 719;
        item 727;
        item 733;
        item 739;
        item 743;
        item 751;
        item 757;
        item 761;
        item 769;
        item 773;
        item 787;
        item 797;
        item 809;
        item 811;
        item 821;
        item 823;
        item 827;
        item 829;
        item 839;
        item 853;
        item 857;
        item 859;
        item 863;
        item 877;
        item 881;
        item 883;
        item 887;
        item 907;
        item 911;
        item 919;
        item 929;
        item 937;
        item 941;
        item 947;
        item 953;
        item 967;
        item 971;
        item 977;
        item 983;
        item 991;
        item 997;
        end;
    },
    "find primes up to 1000",
); # end: 92102a05-4c7c-47de-9ed0-b7d5fcd00f21

done_testing;
