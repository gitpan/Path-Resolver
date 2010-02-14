
use strict;
use warnings;



use ExtUtils::MakeMaker 6.11;



my %WriteMakefileArgs = (
                       'test' => {
                                   'TESTS' => 't/*.t'
                                 },
                       'NAME' => 'Path::Resolver',
                       'DISTNAME' => 'Path-Resolver',
                       'AUTHOR' => 'Ricardo Signes <rjbs@cpan.org>',
                       'ABSTRACT' => 'go from "file" names to things',
                       'EXE_FILES' => [],
                       'VERSION' => '3.100450',
                       'LICENSE' => 'perl',
                       'PREREQ_PM' => {
                                        'MooseX::Types::Moose' => 0,
                                        'File::Spec' => 0,
                                        'Data::Section' => 0,
                                        'Moose::Util::TypeConstraints' => 0,
                                        'File::Spec::Unix' => 0,
                                        'File::ShareDir' => 0,
                                        'autodie' => 0,
                                        'Path::Class::File' => 0,
                                        'Archive::Tar' => 0,
                                        'Moose' => 0,
                                        'Moose::Role' => 0,
                                        'namespace::autoclean' => 0,
                                        'ExtUtils::MakeMaker' => '6.11',
                                        'Carp' => 0,
                                        'Test::More' => 0,
                                        'MooseX::AttributeHelpers' => 0,
                                        'MooseX::Types' => 0,
                                        'Path::Class' => '0',
                                        'Cwd' => 0
                                      }
                     );


delete $WriteMakefileArgs{LICENSE}
  unless eval { ExtUtils::MakeMaker->VERSION(6.31) };

WriteMakefile(%WriteMakefileArgs);



