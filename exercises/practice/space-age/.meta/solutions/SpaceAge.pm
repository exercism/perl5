package SpaceAge;

use strict;
use warnings;
use feature      qw<say>;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<age_on_planet>;

# Solved by GitHub Copilot
sub age_on_planet ( $planet, $seconds ) {
    my %orbital_periods = (
        Mercury => 0.2408467,
        Venus   => 0.61519726,
        Earth   => 1.0,
        Mars    => 1.8808158,
        Jupiter => 11.862615,
        Saturn  => 29.447498,
        Uranus  => 84.016846,
        Neptune => 164.79132,
    );

    die "not a planet" unless exists $orbital_periods{$planet};

    my $earth_years   = $seconds / 31557600;
    my $age_on_planet = $earth_years / $orbital_periods{$planet};

    return sprintf "%.2f", $age_on_planet;
}

1;
