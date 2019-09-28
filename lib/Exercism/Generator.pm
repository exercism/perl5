package Exercism::Generator;

use Moo;

use Path::Tiny;
use Perl::Tidy;
use Template::Mustache qw(render);

use constant BASE_DIR =>
  path(__FILE__)->realpath->parent->parent->parent;
use Exporter qw(import);
our @EXPORT_OK = qw(BASE_DIR);

has [qw(data exercise)] => (
  is       => 'ro',
  required => 1,
);

has [qw(cdata ignore_cdata)] => ( is => 'lazy' );

sub test {
  $_[0]->_render( { template => 'test' } );
}

sub stub {
  $_[0]->_render( { template => 'module', file => 'stub' } );
}

sub example {
  $_[0]->_render( { template => 'module', file => 'example' } );
}

sub _render {
  my ( $self, $params ) = @_;
  my $data = { %{ $self->data } };
  if ( $self->cdata && !$self->ignore_cdata ) {
    $data->{cdata}{json} = $self->cdata;
  }

  if ( $params->{file} ) {
    $data->{module_file} = $data->{ $params->{file} };
  }
  my $rendered = Template::Mustache->render(
    BASE_DIR->child(
      'templates/' . $params->{template} . '.mustache'
    )->slurp,
    $data,
  );
  Perl::Tidy::perltidy(
    source      => \$rendered,
    argv        => '',
    destination => \my $tidied,
  );
  return $tidied;
}

sub _build_ignore_cdata {
  $_[0]->data->{ignore_cdata};
}

sub _build_cdata {
  my ($self) = @_;
  my $cdata_file
    = BASE_DIR->child( 'problem-specifications/exercises/'
      . $self->exercise
      . '/canonical-data.json' );
  if ( $cdata_file->is_file ) {
    return $cdata_file->slurp =~ s/^\s+|\s+$//gr;
  }
  return;
}

1;
