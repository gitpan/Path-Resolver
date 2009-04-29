package Path::Resolver::Resolver::Archive::Tar;
our $VERSION = '2.002';

# ABSTRACT: find content inside a tar archive
use Moose;
use Moose::Util::TypeConstraints;
with 'Path::Resolver::Role::Resolver';

use Archive::Tar;
use File::Spec::Unix;


has archive => (
  is  => 'ro',
  required    => 1,
  initializer => sub {
    my ($self, $value, $set) = @_;

    my $archive = ref $value ? $value : Archive::Tar->new($value);

    confess("$value is not a valid archive value")
      unless class_type('Archive::Tar')->check($archive);
    
    $set->($archive);
  },
);


has root => (
  is => 'ro',
  required => 0,
);

sub content_for {
  my ($self, $path) = @_;
  my $root = $self->root;
  my @root = (length $root) ? $root : ();

  my $filename = File::Spec::Unix->catfile(@root, @$path);
  return unless $self->archive->contains_file($filename);
  my $content = $self->archive->get_content($filename);

  return \$content;
}

no Moose;
no Moose::Util::TypeConstraints;
__PACKAGE__->meta->make_immutable;

__END__

=pod

=head1 NAME

Path::Resolver::Resolver::Archive::Tar - find content inside a tar archive

=head1 VERSION

version 2.002

=head1 ATTRIBUTES

=head2 archive

This attribute stores the Archive::Tar object in which content will be
resolved.  A simple string may be passed to the constructor to be used as an
archive filename.

=head2 root

If given, this attribute specifies a root inside the archive under which to
look.  This is useful when dealing with an archive in which all content is
under a common directory.

=head1 AUTHOR

  Ricardo Signes <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Ricardo Signes.

This is free software; you can redistribute it and/or modify it under
the same terms as perl itself.

=cut 

