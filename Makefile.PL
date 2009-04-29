
use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  DISTNAME  => 'Path-Resolver',
  NAME      => 'Path::Resolver',
  AUTHOR    => 'Ricardo\ Signes\ \<rjbs\@cpan\.org\>',
  ABSTRACT  => 'go from "file" names to things',
  VERSION   => '2.001',
  EXE_FILES => [ qw() ],
  (eval { ExtUtils::MakeMaker->VERSION(6.21) } ? (LICENSE => 'perl') : ()),
  PREREQ_PM    => {
    "File::ShareDir" => '1',
    "File::Spec" => '0',
    "Data::Section" => '0',
    "Archive::Tar" => '0',
    "Moose" => '0',
  },
);
