# NAME

Mojolicious::Plugin::Host - Easily get the host for the current request

# STATUS

<div>
    <a href="https://travis-ci.org/srchulo/Mojolicious-Plugin-Host"><img src="https://travis-ci.org/srchulo/Mojolicious-Plugin-Host.svg?branch=master"></a> <a href='https://coveralls.io/github/srchulo/Mojolicious-Plugin-Host?branch=master'><img src='https://coveralls.io/repos/github/srchulo/Mojolicious-Plugin-Host/badge.svg?branch=master' alt='Coverage Status' /></a>
</div>

# SYNOPSIS

    # Mojolicious::Lite
    plugin 'Host';

    # Mojolicious
    $app->plugin('Host');

    # remove www. from all hosts
    $app->plugin(Host => { www => 'never' });

    # add www. to all hosts
    $app->plugin(Host => { www => 'always' });

    # provide your own helper name and use different host helpers
    $app->plugin(Host => { helper => 'host' }); # default
    $app->plugin(Host => { helper => 'www_host', www => 'always' });
    $app->plugin(Host => { helper => 'no_www_host', www => 'never' });

    my $raw_host = $app->host;
    my $www_host = $app->www_host;
    my $no_www_host = $app->no_www_host;

# DESCRIPTION

[Mojolicious::Plugin::Host](https://metacpan.org/pod/Mojolicious::Plugin::Host) allows you to easily access the host for the current request.
You may use ["helper"](#helper) to change the name of the helper, or ["www"](#www) to modify the host before it
is returned.

# OPTIONS

## helper

    $app->plugin(Host => { helper => 'host' }); # default
    $app->plugin(Host => { helper => 'www_host', www => 'always' });
    $app->plugin(Host => { helper => 'no_www_host', www => 'never' });

    # request to mojolicious.org

    # contains mojolicious.org
    my $host = $app->host;

    # contains www.mojolicious.org
    my $www_host = $app->host;

    # contains mojolicious.org
    my $no_www_host = $app->no_www_host;

["helper"](#helper) allows you to set the name of the helper. This can be useful for clarity or if you want to use
multiple ["www"](#www) options at once.

## www

    # ensure a www. is always present at the beginning of a host
    $app->plugin(Host => { www => 'always' };

    # ensure a www. is never present at the beginning of a host
    $app->plugin(Host => { www => 'never' };

    # pass the host through unaltered
    $app->plugin('Host');

The ["www"](#www) option allows you to specify how you would like a leading `www.` to be handled
before being returned. There are three options:

### always

    # ensure a www. is always present at the beginning of a host
    $app->plugin(Host => { www => 'always' };

    # request to mojolicious.org returns www.mojolicious.org
    my $host = $c->host;

    # request to www.mojolicious.org returns www.mojolicious.org
    my $host = $c->host;

["always"](#always) will append `www.` to the beginning of the host if it is not there before returning it.

### never

    # ensure a www. is never present at the beginning of a host
    $app->plugin(Host => { www => 'never' };

    # request to mojolicious.org returns mojolicious.org
    my $host = $c->host;

    # request to www.mojolicious.org returns mojolicious.org
    my $host = $c->host;

["never"](#never) will remove any `www.` at the beginning of the host before returning it.

### unspecified

    # pass hosts through unmodified
    $app->plugin('Host');

    # request to mojolicious.org returns mojolicious.org
    my $host = $c->host;

    # request to www.mojolicious.org returns www.mojolicious.org
    my $host = $c->host;

Not specifying ["www"](#www) will pass hosts through unmodified. This is equivalent to calling:

    my $host = $c->req->url->to_abs->host;

# METHODS

## host

    # returns host based on the provided options
    my $host = $c->host;

["host"](#host) returns the host for the current request. See ["www"](#www) for how to potentially modify the returned host.

The name of this method may be changed by using the ["helper"](#helper) option.

# AUTHOR

Adam Hopkins <srchulo@cpan.org>

# COPYRIGHT

Copyright 2019- Adam Hopkins

# LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# SEE ALSO

- [Mojolicious](https://metacpan.org/pod/Mojolicious)
- [Mojolicious::Controller](https://metacpan.org/pod/Mojolicious::Controller)
- [Mojo::URL](https://metacpan.org/pod/Mojo::URL)
