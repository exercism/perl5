package OCRNumbers;

use strict;
use warnings;
use feature      qw<say>;
use experimental qw<signatures postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<convert_ocr>;

sub convert_ocr {
    my ($string) = @_;
    return $string;
}

1;
