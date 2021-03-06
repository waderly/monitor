# APItools Traffic Monitor [![Build Status](https://travis-ci.org/APItools/monitor.svg?branch=master)](https://travis-ci.org/APItools/monitor)

APITools is a hosted proxy mailny for API calls, but can be used as general programmable proxy.
It has analytics, lua middleware, storing passed calls and many other features.

# Building and Developing

You need Ruby 2.1.2 to run build this project and Openresty to run it.
Then you can just run it like:

```bash
bundle
foreman start
```

If you want to know how exacly is each component started, check Procfile.

You will need running redis server.

# Tests
We have several test suites for differrent components. First are API tests that require `ruby` and you can run them by `rake test:api`. You need to have an instance running on ports 7071 and 10002. Then there is `rake test:integration` which runs cucumber tests with real browsers simulating user interactions. Next are `rake test:lua` which are lua tests. They require openresty version at least `1.7.4.1`. Last are Angular tests, that require `nodejs`. You can install all dependencies by `npm install` and then just `rake test:angular`.

## Installing Openresty


### Installing Openresty on OSX

Install [homebrew](http://brew.sh/)

```bash
brew tap killercup/homebrew-openresty
brew install ngx_openresty --with-gunzip --with-luajit-checkhook
brew install luarocks

luarocks install luajson luaexpat
```

### Linux

You can follow our Dockerfile with exact commands how to install Openresty on Linux.
You don't have to use all the flags or prefix. The essense should be:

```bash
wget http://openresty.org/download/ngx_openresty-1.7.2.1.tar.gz
tar xzf ngx_openresty-1.7.2.1.tar.gz
cd ngx_openresty-1.7.2.1
./configure --with-luajit-xcflags=-DLUAJIT_ENABLE_LUA52COMPAT --with-http_gunzip_module
make
sudo make install
```

For SSL of HTTP client you need ngx_openresty-1.7.4.1rc2, apply our patch like:

```bash
curl https://gist.githubusercontent.com/mikz/4dae10a0ef94de7c8139/raw/
33d6d5f9baf68fc5a0748b072b4d94951e463eae/system-ssl.patch | patch -p0
```
and then configure and build like usual.

# Install Guide
You can find the full Install Guide in [our documentation](https://docs.apitools.com/docs/on-premise/).

## Debian/Ubuntu

Use our packages available from https://packagecloud.io/APItools/monitor.

## OSX

Follow [Installing Openresty on OSX](#installing-openresty-on-osx) to get Openresty running.
Then you can use a release or build it yourself.

# Running it

```bash
nginx -p /path/to/folder -c config/nginx.conf
```

## OSX

On OSX instead of `nginx` use `openresty`.


# Contributing

We accept Pull Requests, but please check before doing so if it meets the target of this project.

For contributing guide check [CONTRIBUTING.md](CONTRIBUTING.md).
