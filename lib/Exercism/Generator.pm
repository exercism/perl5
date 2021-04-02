package Exercism::Generator;

use Moo;
use namespace::autoclean;

use JSON::PP ();
use List::Util qw<any>;
use Path::Tiny qw<path>;
use Perl::Tidy ();
use Template::Mustache qw<render>;
use TOML::Parser ();

use lib::gitroot qw<:set_root :once>;

use constant {
  BASE_DIR => path(GIT_ROOT),
  JSON     => JSON::PP->new->canonical->pretty->space_before(0)
    ->indent_length(2),
};

has exercise => (
  is       => 'ro',
  required => 1,
);

has data => (
  is  => 'ro',
  isa => sub {
    ref $_[0] eq 'HASH'
      or die '"data" attribute expects a hash reference';
  },
  default => sub { {} },
);

has [
  qw<
    case_uuids
    cases
    cdata
    json_tests
    package
  >
] => ( is => 'lazy' );

# test returns the test file rendered from the template
sub test {
  $_[0]->_render;
}

# stub returns the stub module file rendered from the template
sub stub {
  my ($self) = @_;
  $self->_render( $self->data->{stub} || '' );
}

# examples returns the example module files rendered from the template
sub examples {
  my ($self) = @_;
  return $self->data->{examples}
    ? {
    map { $_ => $self->_render( $self->data->{examples}{$_} ) }
      keys %{ $self->data->{examples} }
    }
    : { base => $self->_render( $self->data->{example} || '' ) };
}

sub _render {
  my ( $self, $module_file ) = @_;
  my %data = %{ $self->data };
  $data{cases}   //= $self->json_tests;
  $data{package} //= $self->package;

  my $rendered = Template::Mustache->render(
    BASE_DIR->child( 'templates',
      ( $module_file ? 'module' : 'test' ) . '.mustache' )
      ->slurp_utf8,
    { %data, module_file => $module_file }
  );

  Perl::Tidy::perltidy(
    source      => \$rendered,
    argv        => '',
    perltidyrc  => BASE_DIR->child('.perltidyrc')->stringify,
    destination => \my $tidied,
  );

  return $tidied;
}

sub _build_package {
  my ($self) = @_;
  return $self->data->{package} // join( '',
    map( ucfirst, split( /-/, lc( $self->exercise ) ) ) );
}

# case_uuids contains an array of UUIDs marked as true in tests.toml
sub _build_case_uuids {
  my ($self) = @_;

  my $toml_file = BASE_DIR->child(
    'exercises', 'practice', $self->exercise, '.meta',
    'tests.toml'
  );

  my $toml_data;
  if ( $toml_file->is_file ) {
    $toml_data = TOML::Parser->new->parse( $toml_file->slurp_utf8 );
    return [
      grep { $toml_data->{'canonical-tests'}{$_} }
        keys %{ $toml_data->{'canonical-tests'} }
    ];
  }

  return [];
}

# cases is an array of the cases matching case_uuids
sub _build_cases {
  my ( $self, $obj, $description ) = @_;
  $description //= '';

  return [] if !$self->cdata;

  $obj //= JSON->decode( $self->cdata );
  my $new_desc = '';

  if ( $obj->{cases} ) {
    $new_desc
      = $description
      . $obj->{description}
      . ( $obj->{description} =~ /:$/ ? ' ' : ': ' )
      if $obj->{description};

    return [
      map {
        @{ $self->_build_cases( $_, $new_desc || $description ) }
      } @{ $obj->{cases} }
    ];
  }
  elsif ( any { $_ eq $obj->{uuid} } @{ $self->case_uuids } ) {
    return [
      { %{$obj}{qw<input expected property>},
        description => $description . $obj->{description}
      }
    ];
  }

  return [];
}

# cdata is the canonical-data.json for an exercise in problem-specifications
sub _build_cdata {
  my ($self) = @_;
  my $cdata_file
    = BASE_DIR->child( '.problem-specifications', 'exercises',
    $self->exercise, 'canonical-data.json' );

  if ( $cdata_file->is_file ) {
    return $cdata_file->slurp_utf8 =~ s/^\s+|\s+$//gr;
  }

  return '';
}

# json_tests is cases transformed into a JSON array
sub _build_json_tests {
  my ($self) = @_;
  return @{ $self->cases }
    ? JSON->encode( $self->cases ) =~ s/^\s+|\s+$//gr
    : '';
}

1;
