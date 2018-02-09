package FoodChainSong;

use strict;
use warnings;

use feature qw(switch);

sub new { bless {} => $_[0] }

sub verse {
    my ($self, $n) = @_;
    given ($n) {
        when (1) { return <<'SONG';
I know an old lady who swallowed a fly.
I don't know why she swallowed the fly. Perhaps she'll die.
SONG
        }
        when (2) { return <<'SONG';
I know an old lady who swallowed a spider.
It wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.
SONG
        }
        when (3) { return <<'SONG';
I know an old lady who swallowed a bird.
How absurd to swallow a bird!
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.
SONG
        }
        when (4) { return <<'SONG';
I know an old lady who swallowed a cat.
Imagine that, to swallow a cat!
She swallowed the cat to catch the bird.
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.
SONG
        }
        when (5) { return <<'SONG';
I know an old lady who swallowed a dog.
What a hog, to swallow a dog!
She swallowed the dog to catch the cat.
She swallowed the cat to catch the bird.
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.
SONG
        }
        when (6) { return <<'SONG';
I know an old lady who swallowed a goat.
Just opened her throat and swallowed a goat!
She swallowed the goat to catch the dog.
She swallowed the dog to catch the cat.
She swallowed the cat to catch the bird.
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.
SONG
        }
        when (7) { return <<'SONG';
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
        }
        when (8) { return <<'SONG';
I know an old lady who swallowed a horse.
She's dead, of course!
SONG
        }
    }
}

sub verses {
    my ($self, @numbers) = @_;
    my @verses = map { $self->verse($_) . "\n" } @numbers;
    join "" => @verses
}

sub sing { $_[0]->verses(1, 8) }

1;
