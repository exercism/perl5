## Code Style and Linting

If you are looking for good general advices regarding Perl coding, 
Damian Conway's [Perl Best Practices][PBP] is a good reference. 

To prettify your code, you can use the module
[Perl-Tidy][PerlTidy].

To install with [cpanminus][]:

    cpanm Perl-Tidy

or via the regular `cpan` install utility:

    cpan Perl-Tidy

And then, you can use the provided `perltidy` utility program 
to reformat your code.

    # modify file in-place and save old version as some_script.pl.bak
    $ perltidy -b some_script.pl

`perltidy` has a *lot* of configuration options to cater to every taste. They
are documented [here][perltidyDocs].

There is also [tidyview], a visual interface that allows you to 
tweak the different options and immediately see the result.

If you want to enforce coding practices, there is also
[Perl::Critic][perlcritic]. It comes with the rules described in 
the book *Perl Best Practices* mentioned previously, but plenty of 
plugins exist, and it can be customized to fit any in-house coding 
rules.

To install:

    # via cpanminus
    cpanm Perl-Critic

    # via the classic 'cpan' installation tool
    cpan Perl-Critic

To use:

    $ perlcritic some_script.pl

The tool has many, many configuration tweaks, see its
[documentation][perlcriticdocs] for the full scoop on them.


[PBP]:            http://shop.oreilly.com/product/9780596001735.do
[PerlTidy]:       https://metacpan.org/release/Perl-Tidy
[cpanminus]:      http://search.cpan.org/~miyagawa/App-cpanminus-1.7042
[perltidyDocs]:   https://metacpan.org/pod/distribution/Perl-Tidy/docs/stylekey.pod
[tidyview]:       https://sourceforge.net/projects/tidyview/
[perlcritic]:     https://metacpan.org/release/Perl-Critic
[perlcriticdocs]: https://metacpan.org/pod/distribution/Perl-Critic/bin/perlcritic
