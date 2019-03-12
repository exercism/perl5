### Windows:
[Strawberry Perl](http://strawberryperl.com/): A 100% Open Source Perl for
Windows that is exactly the same as Perl everywhere else; this includes using
modules from CPAN, without the need for binary packages.

### Unix/Linux/Mac OSX:
Perl is likely already installed. Run `perl -v` to check which version you have.
If your version is older than v5.14.0, or you would like to try out newer versions
of Perl 5, take a look at 'Other Options'.

If you are using Fedora/Red Hat/CentOS, some core modules are not included with Perl.
Use the `yum install perl-core` command to install them.

### Install Basic Development Tools

#### RedHat, CentOS, Fedora and similar

Use the following set of commands to install development packages on your RedHat and their derivative systems.

```shell

### CentOS/RHEL 7/6/5 
sudo yum update
sudo yum groupinstall "Development Tools"

### Fedora 28/27/26/25/24/23 
sudo dnf update
sudo dnf groupinstall "Development Tools"

```

#### Debian, Ubuntu and similar

```shell

sudo apt update
sudo apt install build-essentials

```

#### Mac OSX

```shell

xcode-select --install

```

### Install Test Suite
The Perl 5 track in Exercism uses Test2 Suite to verify the codes. 
It's mandatory installing this suite to have your tests verifyied.


We strongly recommend you installing local::lib and cpanminus, 
so you could install packages and work under your own workspace.
 

```shell

wget -O- http://cpanmin.us | perl - -l ~/perl5 App::cpanminus local::lib
eval `perl -I ~/perl5/lib/perl5 -Mlocal::lib`
echo 'eval `perl -I ~/perl5/lib/perl5 -Mlocal::lib`' >> ~/.profile
echo 'export MANPATH=$HOME/perl5/man:$MANPATH' >> ~/.profile
cpan install Test::V0 

```

Optionally and if Perl 5 is up and running in your system just use 
the command bellow to install the Test2 Suite globally in your system:

```shell

sudo cpan install Test::V0 

```



Otherwise use one of the options bellow:

### Other Options:
* [perlbrew](https://perlbrew.pl/): A tool to manage multiple perl installations
  in your `$HOME` directory. They are completely isolated perl universes.
* [plenv](https://github.com/tokuhirom/plenv): Installs perls under your home
  directory and lets you install modules locally, and allows you to switch to
  arbitrary perl versions on your shell.
* [ActivePerl Community Edition](https://www.activestate.com/activeperl/downloads):
  A free, ready-to-install Perl distribution for Windows, Linux and Mac OS X, designed 
  for community developers or open source projects that are not business- or mission-critical.
