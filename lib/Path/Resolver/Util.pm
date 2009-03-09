package Path::Resolver::Util;
our $VERSION = '2.000';

use strict;
use warnings;
# ABSTRACT: random dumping-ground for Path::Resolver snippets

sub _content_at_abs_path {
  my ($self, $abs_path) = @_;
  return unless -e $abs_path;

  open my $fh, '<', $abs_path or Carp::confess("can't open $abs_path: $!");
  my $content = do { local $/; <$fh> };
  return \$content;
}

1;

__END__

=pod

=head1 NAME

Path::Resolver::Util - random dumping-ground for Path::Resolver snippets

=head1 VERSION

version 2.000

=head1 AUTHOR

  Ricardo Signes <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Ricardo Signes.

This is free software; you can redistribute it and/or modify it under
the same terms as perl itself.

=cut 


