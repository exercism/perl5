Execute tests with:

```bash
$ prove bob_test.t
```

## Creating Your First Perl5 Module

In order to have your solution work correctly with the test specification,
you'll need to create a Perl module. To get started, create a file in the
perl5 directory called "bob.pm", with the following contents:

```bash
package Bob;

use strict;
use Exporter;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);

$VERSION     = 1.00;
@ISA         = qw(Exporter);
@EXPORT      = ();
@EXPORT_OK   = qw(hey);
%EXPORT_TAGS = ( DEFAULT => [qw(&hey)],
                );

sub hey {
	#
	# Your Perl solution goes here
	#
}

1;
````
