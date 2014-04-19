package Example;

sub verse { 
    my $num = shift;
    my $song = _line1($num) . _line2($num);
    return $song;
}

sub sing {
    my ($start, $end) = @_;
    $end = 0 unless $end;
    my $song;

    while ($start >= $end) {
        $song .= verse($start);
        $song .= "\n";
        $start--;
    }

    return $song;
}

sub _line1 {
    my $num = shift;

    if ($num > 1) {
        return "$num bottles of beer on the wall, $num bottles of beer.\n";
    }
    elsif ($num == 1) {
        return "1 bottle of beer on the wall, 1 bottle of beer.\n";
    }
    elsif ($num == 0) {
        return "No more bottles of beer on the wall, no more bottles of beer.\n";
    }
}

sub _line2 {
    my $num = shift;

    if ($num > 2) {
        $num--;
        return "Take one down and pass it around, $num bottles of beer on the wall.\n";
    }
    elsif ($num == 2) {
        return "Take one down and pass it around, 1 bottle of beer on the wall.\n";
    }
    elsif ($num == 1) {
        return "Take it down and pass it around, no more bottles of beer on the wall.\n";
    }
    elsif ($num == 0) {
        return "Go to the store and buy some more, 99 bottles of beer on the wall.\n";
    }
}
__PACKAGE__;
