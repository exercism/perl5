#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Minesweeper qw<annotate>;

imported_ok qw<annotate> or bail_out;

is(
    annotate(""),
    "",
    "no rows",
);

is(
    annotate(""),
    "",
    "no columns",
);

is(
    annotate("   \n   \n   "),
    "   \n   \n   ",
    "no mines",
);

is(
    annotate("***\n***\n***"),
    "***\n***\n***",
    "minefield with only mines",
);

is(
    annotate("   \n * \n   "),
    "111\n1*1\n111",
    "mine surrounded by spaces",
);

is(
    annotate("***\n* *\n***"),
    "***\n*8*\n***",
    "space surrounded by mines",
);

is(
    annotate(" * * "),
    "1*2*1",
    "horizontal line",
);

is(
    annotate("*   *"),
    "*1 1*",
    "horizontal line, mines at edges",
);

is(
    annotate(" \n*\n \n*\n "),
    "1\n*\n2\n*\n1",
    "vertical line",
);

is(
    annotate("*\n \n \n \n*"),
    "*\n1\n \n1\n*",
    "vertical line, mines at edges",
);

is(
    annotate("  *  \n  *  \n*****\n  *  \n  *  "),
    " 2*2 \n25*52\n*****\n25*52\n 2*2 ",
    "cross",
);

is(
    annotate(" *  * \n  *   \n    * \n   * *\n *  * \n      "),
    "1*22*1\n12*322\n 123*2\n112*4*\n1*22*2\n111111",
    "large minefield",
);

done_testing;
