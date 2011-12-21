use strict;
use warnings;

use Test::More;

my $filename = 'Makefile.PL';
my @expected = do { open my $exp, '<', $filename; <$exp>; };

plan tests => 2 + @expected;

use_ok('File::Open::OOP');

my $fh = File::Open::OOP::oopen($filename);
isa_ok $fh, 'File::Open::OOP';

my $c = -1;
while (my $line = $fh->readline) {
	$c++;
	my $title = $line;
	chomp $title;
	is $line, $expected[$c], $title;
}

