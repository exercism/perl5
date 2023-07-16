#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Sieve qw<find_primes>;

imported_ok qw<find_primes> or bail_out;

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
    [ 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331, 337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397, 401, 409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467, 479, 487, 491, 499, 503, 509, 521, 523, 541, 547, 557, 563, 569, 571, 577, 587, 593, 599, 601, 607, 613, 617, 619, 631, 641, 643, 647, 653, 659, 661, 673, 677, 683, 691, 701, 709, 719, 727, 733, 739, 743, 751, 757, 761, 769, 773, 787, 797, 809, 811, 821, 823, 827, 829, 839, 853, 857, 859, 863, 877, 881, 883, 887, 907, 911, 919, 929, 937, 941, 947, 953, 967, 971, 977, 983, 991, 997 ],
    "find primes up to 1000",
); # end: 92102a05-4c7c-47de-9ed0-b7d5fcd00f21

done_testing;
