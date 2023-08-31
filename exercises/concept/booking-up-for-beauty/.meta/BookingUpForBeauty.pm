package BookingUpForBeauty;

use v5.38;

use Time::Piece;
#use Readonly;

use Exporter ('import');
our @EXPORT_OK = (
    'appointment_has_passed',
    'is_afternoon_appointment',
    'describe_appointment',
);

# Commented for portability
#Readonly::Scalar
    my $STRPTIME_FORMAT =#>
    '%Y-%m-%d' . 'T' . '%H:%M:%S';

sub _parse_date ($date_string) {
    return Time::Piece->strptime($date_string, $STRPTIME_FORMAT);
}

sub appointment_has_passed ($date_string) {
    return _parse_date($date_string) < Time::Piece->gmtime; 
}

sub is_afternoon_appointment ($date_string) {
    my $time = _parse_date($date_string);
    return $time->hour >= 12 && $time->hour < 18;
}

sub describe_appointment ($date_string) {
    my $time = _parse_date($date_string);
    return sprintf(
        'You have an appointment on %02d/%02d/%04d %d:%02d %s',
        $time->mon, $time->mday, $time->year,
        ($time->hour % 12) || 12, $time->min, $time->hour < 12 ? 'AM' : 'PM',
    );
}
