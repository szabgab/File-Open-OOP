package File::Open::OOP;
use strict;
use warnings;

our $VERSION = '0.01';

use File::Open qw(fopen);

sub new {
	my ($class) = @_;
	my $self = {};

	return bless $self, $class;
}

sub oopen {
	#fopen
	return __PACKAGE__->new;
}


1;
