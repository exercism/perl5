#!/usr/bin/env perl
use warnings;
use strict;

use Test::More tests => 10;
use FindBin;
my $dir;
BEGIN { $dir = $FindBin::Bin . '/' };
use lib $dir;

my $module = 'NucleotideCount';

use_ok($module) or BAIL_OUT "You need to create a module called $module.pm";

sub new_dna {
  no strict 'refs';
  $module->new(@_);
}

is new_dna('')->count('A'), 0, 'empty dna string has no adenosine';

is_deeply new_dna('')->nucleotide_counts, { A => 0, T => 0, C => 0, G => 0, },
'empty dna tring has no nucleotides';

is new_dna('CCCCC')->count('C'), 5, 'repetitive cytidine gets counted';

is_deeply new_dna('GGGGGGGG')->nucleotide_counts, { A => 0, T => 0, C => 0, G => 8, },
'repititve sequence has only guanosine';

is new_dna('GGGGGTAACCCGG')->count('T'), 1, 'counts only thymidine';

for (1) {
  my $dna = new_dna('CGATTGGG');
  $dna->count('T');
  is $dna->count('T'), 2, 'counts a nucleotide only once';
}

eval { new_dna('GACT')->count('X') };
like $@, qr/invalid/i, 'validates nucleotides';

eval { new_dna('JOHNNYAPPLESEED') };
like $@, qr/invalid/i, 'validates dna';

is_deeply new_dna('AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC')->nucleotide_counts,
{ A => 20, T => 21, G => 17, C => 12, },
'counts all nucleotides';
