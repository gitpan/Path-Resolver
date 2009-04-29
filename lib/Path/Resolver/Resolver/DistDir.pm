package Path::Resolver::Resolver::DistDir;
our $VERSION = '2.002';

# ABSTRACT: find content in a prebound CPAN distribution's "ShareDir"
use Moose;
with 'Path::Resolver::Role::Resolver';

use File::ShareDir ();
use File::Spec;
use Path::Resolver::Util;


has dist_name => (
  is  => 'ro',
  isa => 'Str',
  required => 1,
);

sub content_for {
  my ($self, $path) = @_;
  my $dir = File::ShareDir::dist_dir($self->dist_name);

  my $abs_path = File::Spec->catfile(
    $dir,
    File::Spec->catfile(@$path),
  );

  return Path::Resolver::Util->_content_at_abs_path($abs_path);
}

no Moose;
__PACKAGE__->meta->make_immutable;

__END__

=pod

=head1 NAME

Path::Resolver::Resolver::DistDir - find content in a prebound CPAN distribution's "ShareDir"

=head1 VERSION

version 2.002

=head1 ATTRIBUTES

=head2 dist_name

This is the name of a dist (like "Path-Resolver").  When looking for content,
the resolver will look in the dist's shared content directory, as located by
L<File::ShareDir|File::ShareDir>.

=head1 AUTHOR

  Ricardo Signes <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Ricardo Signes.

This is free software; you can redistribute it and/or modify it under
the same terms as perl itself.

=cut 


