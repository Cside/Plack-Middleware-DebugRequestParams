#!/usr/bin/env perl
use 5.10.0;
use strict;
use warnings;
use lib 'lib';
use Plack::Request;
use Plack::Builder;

my $app = sub {
    my $req = Plack::Request->new($_[0]);
    return [200, ["Content-Type" => "text/html"], ['200 OK']];
};

builder {
    enable 'Devel::QueryParam';
    $app;
};
