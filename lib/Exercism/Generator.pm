package Exercism::Generator;
use Template::Mustache 'render';
use Path::Tiny;

my $base_dir = path(__FILE__)->realpath->parent->parent->parent;

sub new {
  my ($class, $attributes) = @_;
  my $self = {
    data     => $attributes->{data},
    exercise => $attributes->{exercise},
  };
  if ($self->{exercise}) {
    my $cdata_file = $base_dir->child('problem-specifications/exercises/'.$self->{exercise}.'/canonical-data.json');
    if ($cdata_file->is_file) {
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
  return $self->_render({template => 'test'});
}

sub stub {
  my ($self) = @_;
  return $self->_render({template => 'module', file => 'stub'});
}

sub example {
  my ($self) = @_;
  return $self->_render({template => 'module', file => 'example'});
}

sub _render {
  my ($self, $params) = @_;
  my $data = $self->{data};
  if ($params->{file}) { $data->{module_file} = $data->{$params->{file}} }
  return Template::Mustache->render($base_dir->child('templates/'.$params->{template}.'.mustache')->slurp, $data);
}
