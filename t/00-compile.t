use strict;
use warnings;

# This test was generated via Dist::Zilla::Plugin::Test::Compile 2.018

use Test::More 0.88;



use Capture::Tiny qw{ capture };

my @module_files = qw(
Path/Resolver.pm
Path/Resolver/CustomConverter.pm
Path/Resolver/Resolver/AnyDist.pm
Path/Resolver/Resolver/Archive/Tar.pm
Path/Resolver/Resolver/DataSection.pm
Path/Resolver/Resolver/DistDir.pm
Path/Resolver/Resolver/FileSystem.pm
Path/Resolver/Resolver/Hash.pm
Path/Resolver/Resolver/Mux/Ordered.pm
Path/Resolver/Resolver/Mux/Prefix.pm
Path/Resolver/Role/Converter.pm
Path/Resolver/Role/FileResolver.pm
Path/Resolver/Role/Resolver.pm
Path/Resolver/SimpleEntity.pm
Path/Resolver/Types.pm
);

my @scripts = qw(

);

# no fake home requested

my @warnings;
for my $lib (@module_files)
{
    my ($stdout, $stderr, $exit) = capture {
        system($^X, '-Mblib', '-e', qq{require q[$lib]});
    };
    is($?, 0, "$lib loaded ok");
    warn $stderr if $stderr;
    push @warnings, $stderr if $stderr;
}



is(scalar(@warnings), 0, 'no warnings found') if $ENV{AUTHOR_TESTING};



done_testing;
