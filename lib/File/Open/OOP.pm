package File::Open::OOP;
use strict;
use warnings;

our $VERSION = '0.01';

use base 'Exporter';
use File::Open qw(fopen);

our @EXPORT_OK = qw(oopen);

sub new {
	my ($class, %args) = @_;
	my $self = \%args;

	return bless $self, $class;
}

sub oopen {
	my $fh = fopen(@_);
	return File::Open::OOP->new(fh => $fh);
}

sub readline {
	my ($self) = @_;
	my $fh = $self->{fh};
	return scalar <$fh>;
}

sub readall {
	my ($self) = @_;
	my $fh = $self->{fh};
	return <$fh>;
}

1;
