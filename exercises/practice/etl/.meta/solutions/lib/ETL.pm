package ETL;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<transform>;

sub transform ($data) {
    return {
        map {
            my $val = $_;
            map { lc($_) => $val } @{ $data->{$_} }
        } keys %{$data}
    };
}

1;
