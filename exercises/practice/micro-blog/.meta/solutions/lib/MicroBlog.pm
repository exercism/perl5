package MicroBlog;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<truncate_post>;

use Encode;

sub truncate_post ($utf8_bytes) {
    return substr( Encode::decode( 'UTF-8', $utf8_bytes ), 0, 5 );
}

1;
