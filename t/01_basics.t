use strict;
use warnings;

use Test::More;

my $filename = 'Makefile.PL';
my @expected = do { open my $exp, '<', $filename; <$exp>; };

plan tests => 4 + 2*@expected;

use_ok('File::Open::OOP');
File::Open::OOP->import('oopen');

my $fh = File::Open::OOP::oopen($filename);
isa_ok $fh, 'File::Open::OOP';

my $in = File::Open::OOP::oopen($filename);
isa_ok $in, 'File::Open::OOP';

my $c = -1;
while (my $line = $fh->readline) {
	$c++;
	my $row = $in->readline;
	my $title = $line;
	chomp $title;
	is $line, $expected[$c], $title;
	is $row, $expected[$c], $title;
}

my @rows = oopen($filename)->readall;
is_deeply \@rows, \@expected, 'readall';

