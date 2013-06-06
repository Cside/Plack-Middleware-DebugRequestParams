package Plack::Middleware::Devel::QueryParam;
use 5.008005;
use strict;
use warnings;
use parent qw(Plack::Middleware);
use Text::ASCIITable;
use Plack::Request;

our $VERSION = "0.01";

sub call {
    my($self, $env) = @_;

    my $req = Plack::Request->new($env);
    my $params = $req->parameters;
    if (%$params) {
        my $table = Text::ASCIITable->new;
        $table->setCols(qw(Parameter Value));
        for my $key (sort keys %$params) {
            my @values = $params->get_all($key);
            for my $value (@values) {
                $table->addRow($key, $value);
            }
        }
        print STDERR $table;
    }

    return $self->app->($env);
}


1;
__END__

=encoding utf-8

=head1 NAME

Plack::Middleware::Devel::QueryParam - It's new $module

=head1 SYNOPSIS

    use Plack::Middleware::Devel::QueryParam;

=head1 DESCRIPTION

Plack::Middleware::Devel::QueryParam is ...

=head1 LICENSE

Copyright (C) Hiroki Honda.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Hiroki Honda E<lt>cside.story@gmail.comE<gt>

=cut

