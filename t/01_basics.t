use strict;
use warnings;

use Test::More;

plan tests => 2;

use_ok('File::Open::OOP');

my $filename = 'Makefile.PL';

my $fh = File::Open::OOP::oopen($filename);
isa_ok $fh, 'File::Open::OOP';

