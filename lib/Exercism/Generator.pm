package Exercism::Generator;
use strict;
use warnings;
use Template::Mustache 'render';
use Path::Tiny;
use Perl::Tidy;
use Exporter 'import';
our @EXPORT_OK = qw(BASE_DIR);

use constant BASE_DIR =>
  path(__FILE__)->realpath->parent->parent->parent;

sub new {
  my ( $class, $attributes ) = @_;
  my $self = {
    data     => $attributes->{data},
    exercise => $attributes->{exercise},
  };
  if ( $self->{exercise} && !$self->{data}{ignore_cdata} ) {
    my $cdata_file
      = BASE_DIR->child( 'problem-specifications/exercises/'
        . $self->{exercise}
        . '/canonical-data.json' );
    if ( $cdata_file->is_file ) {
      $self->{data}{cdata}{json} = $cdata_file->slurp;
      $self->{data}{cdata}{json} =~ s/^\s+|\s+$//g;
    }
  }
  return bless $self, $class;
}

sub cdata {
  my ($self) = @_;
  return $self->{data}{cdata}{json} || '';
}

sub test {
  my ($self) = @_;
  return $self->_render( { template => 'test' } );
}

sub stub {
  my ($self) = @_;
  return $self->_render( { template => 'module', file => 'stub' } );
}

sub example {
  my ($self) = @_;
  return $self->_render(
    { template => 'module', file => 'example' } );
}

sub _render {
  my ( $self, $params ) = @_;
  my $data = $self->{data};
  if ( $params->{file} ) {
    $data->{module_file} = $data->{ $params->{file} };
  }
  my $rendered = Template::Mustache->render(
    BASE_DIR->child(
      'templates/' . $params->{template} . '.mustache'
    )->slurp,
    $data
  );
  Perl::Tidy::perltidy(
    source      => \$rendered,
    argv        => '',
    destination => \my $tidied
  );
  return $tidied;
}
