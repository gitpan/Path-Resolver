
use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  DISTNAME  => 'Path-Resolver',
  NAME      => 'Path::Resolver',
  AUTHOR    => 'Ricardo\ Signes\ \<rjbs\@cpan\.org\>',
  ABSTRACT  => 'go\ from\ \"file\"\ names\ to\ things',
  VERSION   => '3.092200',
  EXE_FILES => [ qw() ],
  (eval { ExtUtils::MakeMaker->VERSION(6.31) } ? (LICENSE => 'perl') : ()),
  PREREQ_PM    => {
    "MooseX::AttributeHelpers" => '0',
    "File::ShareDir" => '1',
    "namespace::autoclean" => '0',
    "MooseX::Types" => '0',
    "File::Spec" => '0',
    "Path::Class" => '0',
    "Data::Section" => '0',
    "Archive::Tar" => '0',
    "Moose" => '0',
  },
);
