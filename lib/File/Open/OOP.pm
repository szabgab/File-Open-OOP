package File::Open::OOP;
use strict;
use warnings;

our $VERSION = '0.01';

use File::Open qw(fopen);

sub new {
	my ($class, %args) = @_;
	my $self = \%args;

	return bless $self, $class;
}

sub oopen {
	my $fh = fopen(@_);
	return __PACKAGE__->new(fh => $fh);
}

sub readline {
	my ($self) = @_;
	my $fh = $self->{fh};
	return scalar <$fh>;
}


1;
