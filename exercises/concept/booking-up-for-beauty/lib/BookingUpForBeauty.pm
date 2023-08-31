package BookingUpForBeauty;

use v5.38;

# Suggested datetime modules you can use:
#use Time::Piece;
#use DateTime::Tiny;

# Recommended, commented out for portability.
#use Readonly;

use Exporter ('import');
our @EXPORT_OK = ();

my $STRPTIME_FORMAT = '%Y-%m-%d' . 'T' . '%H:%M:%S';
#Readonly::Scalar $STRPTIME_FORMAT => $STRPTIME_FORMAT;

# Private subroutines conventionally start with an underscore.
# It isn't necessary, but provided for convenience.
sub _parse_datetime ($date_string) {
    return $date_string;
}

sub appointment_has_passed ($date_string) {
    my $time = _parse_datetime($date_string);
    return undef;
}

sub is_afternoon_appointment ($date_string) {
    my $time = _parse_datetime($date_string);
    return undef;
}

sub describe_appointment ($date_string) {
    my $time = _parse_datetime($date_string);
    return sprintf('You have an appointment on %02d/%02d/%04d %d:%02d %s', 1, 31, 2019, 6, 4, 'PM');
}
