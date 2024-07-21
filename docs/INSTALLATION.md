# Installation

## Perl Version Notes
The track targets the latest stable release of Perl, but it is possible to use versions of Perl as old as 5.20.
If you are unable to use the version specified in the stub files, it is recomended to replace `use v5.XX;` with the following code:

```perl
use strict;
use warnings;
use feature qw<signatures>;
```

## Unix/Linux/Mac OSX
Perl is likely already installed, however it is possible that this may not be the latest version.
Run `perl -v` to check which version you have.
If you wish to use a later version, check the 'Other Options' section.

If you are using Fedora/Red Hat/CentOS, some core modules are not included with Perl.
Use the `yum install perl-core` command to install them.

## Windows
[Strawberry Perl](http://strawberryperl.com/): A 100% Open Source Perl for Windows that is exactly the same as Perl everywhere else;
this includes using modules from CPAN, without the need for binary packages.

You can either install this directly from the site or use the [chocolatey package manager](https://chocolatey.org/packages/StrawberryPerl).

## Other Options
* [asdf](https://asdf-vm.com/):
  A tool version manager allowing for installation of multiple languages, including Perl, which is available as a [community plugin](https://github.com/asdf-vm/asdf-plugins).
* [perlbrew](https://perlbrew.pl/):
  A tool to manage multiple Perl installations in your `$HOME` directory.
  They are completely isolated Perl universes.
* [plenv](https://github.com/tokuhirom/plenv):
  Installs Perls under your home directory and lets you install modules locally, and allows you to switch to arbitrary Perl versions on your shell.
* [ActivePerl Community Edition](https://www.activestate.com/activeperl/downloads):
  A free, ready-to-install Perl distribution for Windows, Linux and Mac OS X, designed for community developers or open source projects that are not business- or mission-critical.

### Installing Necessary Modules
If you are using a version of Perl older than 5.40, you will need to install the `Test2::V0` testing bundle.
Use the following instructions to set this up (or feel free to use your favorite module installer if you are already familiar with Perl):

#### local::lib
* Ensure that the exercism CLI has already been installed and configured.
Running `exercism workspace` should show you the appropriate path.

* Download the `cpm` module installer and use it to install itself,
`local::lib`, and `Test2::V0` into your `exercism/perl5` directory:
```
# *nix
curl -sL --compressed https://git.io/cpm | \
  perl - install -L $(exercism workspace)/perl5 App::cpm local::lib Test2::V0

# Microsoft PowerShell
(Invoke-WebRequest -UseBasicParsing 'https://git.io/cpm').Content |
  perl - install -L "$(exercism workspace)/perl5" App::cpm local::lib Test2::V0
```

* Run `local::lib` to set up your environment to use the modules you have
installed into `exercism/perl5`:
```
# *nix
eval $(perl -I$(exercism workspace)/perl5/lib/perl5 -Mlocal::lib=$(exercism workspace)/perl5)

# Microsoft PowerShell
perl -I"$(exercism workspace)/perl5/lib/perl5"
  -M"local::lib=--shelltype=powershell,$(exercism workspace)/perl5" | Invoke-Expression
```

The environment changes from the above command will not persist, and will
need to be rerun if you restart your shell. If you would like your environment
to be set up automatically each time, modify your `.bashrc` (or \*nix equivalent)
or your `PowerShell_profile.ps1` to include the above command.

The documentation for local::lib can be found [here](https://perldoc.pl/local::lib).

#### OS Packages
Alternatively, the package manager for your OS may have a Test2 Suite package
available for you to install. Available options include:

* Ubuntu: [libtest2-suite-perl](https://launchpad.net/ubuntu/+source/libtest2-suite-perl)
* Debian: [libtest2-suite-perl (via backports)](https://packages.debian.org/stretch-backports/libtest2-suite-perl)
* Arch: [perl-test2-suite](https://www.archlinux.org/packages/community/any/perl-test2-suite/)
