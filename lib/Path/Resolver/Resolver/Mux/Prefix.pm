package Path::Resolver::Resolver::Mux::Prefix;
our $VERSION = '2.002';

# ABSTRACT: multiplex resolvers by using path prefix
use Moose;
with 'Path::Resolver::Role::Resolver';


has prefixes => (
  is  => 'ro',
  isa => 'HashRef',
  required => 1,
);

sub content_for {
  my ($self, $path) = @_;
  my @path = @$path;

  shift @path if $path[0] eq '';

  if (my $resolver = $self->prefixes->{ $path[0] }) {
    shift @path;
    return $resolver->content_for(\@path);
  }

  return unless my $resolver = $self->prefixes->{ '' };

  return $resolver->content_for(\@path);
}

no Moose;
__PACKAGE__->meta->make_immutable;

__END__

=pod

=head1 NAME

Path::Resolver::Resolver::Mux::Prefix - multiplex resolvers by using path prefix

=head1 VERSION

version 2.002

=head1 ATTRIBUTES

=head2 prefixes

This is a hashref of path prefixes with the resolver that should be used for
paths under that prefix.  If a resolver is given for the empty prefix, it will
be used for content that did not begin with registered prefix.

=head1 AUTHOR

  Ricardo Signes <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Ricardo Signes.

This is free software; you can redistribute it and/or modify it under
the same terms as perl itself.

=cut 


