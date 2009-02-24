package Path::Resolver::Resolver::Mux::Ordered;
our $VERSION = '1.000';

# ABSTRACT: multiplex resolvers by checking them in order
use Moose;
with 'Path::Resolver::Role::Resolver';


has resolvers => (
  is  => 'ro',
  isa => 'ArrayRef',
  required   => 1,
  auto_deref => 1,
);

sub content_for {
  my ($self, $path) = @_;

  for my $resolver ($self->resolvers) {
    next unless my $ref = $resolver->content_for($path);
    return $ref;
  }

  return;
}
  
no Moose;
__PACKAGE__->meta->make_immutable;

__END__

=pod

=head1 NAME

Path::Resolver::Resolver::Mux::Ordered - multiplex resolvers by checking them in order

=head1 VERSION

version 1.000

=head1 ATTRIBUTES

=head2 resolvers

This is an array of other resolvers.  When asked for content, the Mux::Ordered
resolver will check each resolver in this array and return the first found
content, or false if none finds any content.

=head1 AUTHOR

  Ricardo Signes <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Ricardo Signes.

This is free software; you can redistribute it and/or modify it under
the same terms as perl itself.

=cut 


