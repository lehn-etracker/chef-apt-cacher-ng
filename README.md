# Apt-Cacher NG cookbook

Apt-Cacher NG is a caching proxy built primarily for Debian (and Debian
based) distributions. It stores all requests, updates and file fetches
in a local cache for a configurable amount of time, speeding up Apt
requests and allowing an offline mode where a server can use the cache
to fetch packages from multiple repositories that would generally be
inaccessable.

This recipe was written to replace the standard `apt::cacher-ng` recipe
in Opscode's `apt` cookbook, which doesn't make installing and using
Apt-Cacher NG as simple as I would have liked. Also, as a seperate full
peice of software, it belongs in its own cookbook, don't you think?


# Installation

Add the following to your Berksfile or Cheffile.

`cookbook 'apt-cacher-ng', git: 'https://github.com/markolson/apt-cacher-ng.git'`

It will not be available through the Opscode Community.

# Usage and Recipes

This cookbook contains two recipes: One to setup the Apt-Cacher NG server,
and another to configure a seperate client/node to use that server as it's
Apt proxy.

## Apt-Cacher NG

`recipe[apt-cacher-ng]`

Installs and starts the Apt-Cacher NG server, also configuring the node by
running the `client` recipe. Set the IP of this server as
`node['apt-cacher-ng']['ipaddress']` in your attributes to make it
available to other nodes.

## Apt Proxy Setup

`recipe[apt-cacher-ng::client]`

Apt honors several types of proxy configurations, and this writes
one into `/etc/apt/apt.conf.d/01proxy`, the same place as `apt::cacher-client`
so we can maintain some compatability.

This uses the `node['apt-cacher-ng']['ipaddress']`
and `node['apt-cacher-ng']['config']['port']` options.


# Attributes

You can find all available options at
http://git.fsinf.at/apt/apt-cacher-ng/blobs/raw/master/conf/acng.conf

Selected options are..

----

`node['apt-cacher-ng']['compiletime']`

Default: `true`

If true, will install, configure and start Apt-Cacher NG immediately. Useful
if you want to cache all requests that occur during a Chef run. If set
to `false`, it will start after the Chef run with the rest of the services
defined during that run.

----

`default['apt-cacher-ng']['ipaddress']`

The IP Address that other hosts can use to reach the node that Apt-Cacher NG
runs on. Use by `apt-cacher-ng::client`, which is also run by `apt-cacher-ng`.

Default: `127.0.0.1`

----

`default['apt-cacher-ng']['config']['cachedir']`

The directory where Apt-Cacher NG will download and store the files it
proxies for clients.

Default: `/var/cache/apt-cacher-ng`

----

`default['apt-cacher-ng']['config']['port']`

The port that Apt-Cacher NG should run on.

*Important Note:* Apt-Cacher NG runs a webserver on this port to display diagnostic and administrative information.

Default: `3142`

----

`default['apt-cacher-ng']['config']['offlinemode']`

Boolean toggle determining if Apt-Cacher NG should attempt outside network access. Only set to `false` if you have
either populated a full cache in the `cachedir` from a prior Chef run you wish you reuse. Useful for running Chef
installations where you have no network access.

Default: `false`

# TODOs

Add Remap options/configuration files
Add user authentication for the webserver
Tests. Gotta figure out how to test this thing.

# Author

Author:: Mark Olson (<theothermarkolson@gmail.com>)
