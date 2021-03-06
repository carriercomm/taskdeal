# TaskDeal

Setup or deploy multiple environments on web browser. Ruby Chef alternative tool.

<img src="http://cdn-ak.f.st-hatena.com/images/fotolife/p/perlcodesample/20130812/20130812143922_original.png?1376285992" width="850">

# Example

[Example](http://perlcodesample.com:10040/) (ID:admin, Password:test)

# Features

* Execute command to multiple machines on web browser.
* Client(machine side) and Server(Web browser side) comunicate using WebSocket. Server can push notice to clients.
* Portable. you can install it into your Unix/Linux server, and cygwin(with gcc4) on windows.
* Perl 5.8.7+ only needed
* SSL support
* You don't have to learn Ruby DSL and cook book as Chef. You can write machine setting by familiar shell.
* You don't have to do client setting becuase command is pushed from server side. It is ok only to connect to server.
* Client command log is send to server. You can know what is done on clinet.

# Installation into own Unix/Linux Server

You can install taskdeal very easy.

## Download

Download tar.gz archive and expand it and change directory.

    curl -kL https://github.com/yuki-kimoto/taskdeal/archive/latest.tar.gz > taskdeal-latest.tar.gz
    tar xf taskdeal-latest.tar.gz
    mv taskdeal-latest taskdeal
    cd taskdeal

## Setup

You execute the following command. Needed modules is installed.

    ./setup.sh

## Test

Do test to check setup process is success or not.

    prove t

If "All tests successful" is shown, setup process is success.

## Operation

### Start/Restart Server

You can start TaskDeal server in the following command.
Server is run in background, port is **10040** by default.

    ./taskdeal-server

You can access the following URL.

    http://localhost:10040
    
If you change port, edit taskdeal-server.conf.
If you can't access this port, you might change firewall setting.

You can execute task to TaskDeal client from TaskDeal server on browser.

Client connection port is 10041 by defaut.

### Stop Server

You can stop server by **--stop** option.

    ./taskdeal-server --stop

### Start Client

You can start TaskDeal client in the following command.

    ./taskdeal-client

Client receive command from server, and execute task.

Client connect to **http://localhost:10041** by default.
If you want to change this value, set **taskdeal-client.conf**
server section host and port.

### Stop Client

You can stop server by **--stop** option.

    ./taskdeal-client --stop

## Server configuration

  See **taskdeal-server.conf**.

## Client configuration

  See **taskdeal-client.conf**

## Role and Task settings

You can create role in <b>server/roles</b> directory.
Role is simple directory which contains tasks.

At first, you create role in <b>server/roles</b> directory.
small and medium is role name. You can give any name to role.

    server/roles/small
                /medium

Task is simple executable file.
You can create task in role directory.

    server/roles/small/echo

echo is task example which echo "foo"

    #!/bin/sh
    echo "foo"

Task can be a hierarchical structure using directory.

    server/roles/small/echo
                      /dir/echo2

## Developer

If you are developer, you can start application development mode
    
    # Run server
    ./devels
    
    # Run cleint
    ./develc

You can access the following URL.

    http://localhost:3000

If you have git, it is easy to install from git.

    git clone git://github.com/yuki-kimoto/taskdeal.git

It is useful to write configuration in taskdeal-client.my.conf and taskdeal-server.my.conf.

## Web Site

[TaskDeal Web Site](http://perlcodesample.sakura.ne.jp/taskdeal-site/)

## Internally Using Library

* [Config::Tiny](http://search.cpan.org/dist/Config-Tiny/lib/Config/Tiny.pm)
* [DBD::SQLite](http://search.cpan.org/dist/DBD-SQLite/lib/DBD/SQLite.pm)
* [DBI](http://search.cpan.org/dist/DBI/DBI.pm)
* [DBIx::Connector](http://search.cpan.org/dist/DBIx-Connector/lib/DBIx/Connector.pm)
* [DBIx::Custom](http://search.cpan.org/dist/DBIx-Custom/lib/DBIx/Custom.pm)
* [Mojolicious](http://search.cpan.org/~kimoto/DBIx-Custom/lib/DBIx/Custom.pm)
* [Mojolicious::Plugin::INIConfig](http://search.cpan.org/dist/Mojolicious-Plugin-INIConfig/lib/Mojolicious/Plugin/INIConfig.pm)
* [mojo-legacy](https://github.com/jamadam/mojo-legacy)
* [Object::Simple](http://search.cpan.org/dist/Object-Simple/lib/Object/Simple.pm)
* [Validator::Custom](http://search.cpan.org/dist/Validator-Custom/lib/Validator/Custom.pm)

## Sister project

* [WebDBViewer](https://github.com/yuki-kimoto/webdbviewer) - Database viewer to see database information on web browser.

## Copyright & license

Copyright 2013-2013 Yuki Kimoto all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.
