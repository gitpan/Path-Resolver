package Path::Resolver::Resolver::AnyDist;
our $VERSION = '2.000';

# ABSTRACT: find content in any installed CPAN distribution's "ShareDir"
use Moose;
with 'Path::Resolver::Role::Resolver';

use File::ShareDir ();
use File::Spec;
use Path::Resolver::Util;

sub content_for {
  my ($self, $path) = @_;
  my $dist_name = shift @$path;
  my $dir = File::ShareDir::dist_dir($dist_name);

  Carp::confess("invalid path: empty after dist specifier") unless @$path;

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

Path::Resolver::Resolver::AnyDist - find content in any installed CPAN distribution's "ShareDir"

=head1 VERSION

version 2.000

=head1 AUTHOR

  Ricardo Signes <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Ricardo Signes.

This is free software; you can redistribute it and/or modify it under
the same terms as perl itself.

=cut 


