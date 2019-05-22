#!/usr/bin/env perl
use strict;
use warnings;

use Test2::Bundle::More;
plan 16;

use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

my $module = 'FoodChainSong';

ok -e "$Bin/$module.pm", "Missing $module.pm"
  or BAIL_OUT "You need to create file: $module.pm";

eval "use $module";
ok !$@, "Cannot load $module"
  or BAIL_OUT
  "Cannot load $module; Does it compile? Does it end with 1;?";

can_ok $module, "new"
  or BAIL_OUT "Missing package $module; or missing sub new()";

can_ok $module, "verse"
  or BAIL_OUT "Missing package $module; or missing sub verse()";

can_ok $module, "verses"
  or BAIL_OUT "Missing package $module; or missing sub verses()";

can_ok $module, "sing"
  or BAIL_OUT "Missing package $module; or missing sub sing()";

my $song = $module->new;

my $expected = <<'SONG';
I know an old lady who swallowed a fly.
I don't know why she swallowed the fly. Perhaps she'll die.
SONG
is $song->verse(1), $expected, "swallow fly at verse(1)";

$expected = <<'SONG';
I know an old lady who swallowed a spider.
It wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.
SONG
is $song->verse(2), $expected, "swallow spider at verse(2)";

$expected = <<'SONG';
I know an old lady who swallowed a bird.
How absurd to swallow a bird!
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.
SONG
is $song->verse(3), $expected, "swallow bird at verse(3)";

$expected = <<'SONG';
I know an old lady who swallowed a cat.
Imagine that, to swallow a cat!
She swallowed the cat to catch the bird.
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.
SONG
is $song->verse(4), $expected, "swallow cat at verse(4)";

$expected = <<'SONG';
I know an old lady who swallowed a dog.
What a hog, to swallow a dog!
She swallowed the dog to catch the cat.
She swallowed the cat to catch the bird.
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.
SONG
is $song->verse(5), $expected, "swallow dog at verse(5)";

$expected = <<'SONG';
I know an old lady who swallowed a goat.
Just opened her throat and swallowed a goat!
She swallowed the goat to catch the dog.
She swallowed the dog to catch the cat.
She swallowed the cat to catch the bird.
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.
SONG
is $song->verse(6), $expected, "swallow goat at verse(6)";

$expected = <<'SONG';
I know an old lady who swallowed a cow.
I don't know how she swallowed a cow!
She swallowed the cow to catch the goat.
She swallowed the goat to catch the dog.
She swallowed the dog to catch the cat.
She swallowed the cat to catch the bird.
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.
SONG
is $song->verse(7), $expected, "swallow cow at verse(7)";

$expected = <<'SONG';
I know an old lady who swallowed a horse.
She's dead, of course!
SONG
is $song->verse(8), $expected, "swallow horse at verse(8)";

$expected = <<'SONG';
I know an old lady who swallowed a fly.
I don't know why she swallowed the fly. Perhaps she'll die.

I know an old lady who swallowed a spider.
It wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.

SONG
is $song->verses( 1, 2 ), $expected,
  "verses(1, 2): swallow fly, swallow spider";

is $song->verses( 1, 8 ), $song->sing, "verses(1, 8): whole song";
