---
title:	'How to use nginx on Travis (or other) CI system'
author: "Wojciech Adam Koszek"
klayout: post
description: >
  Travis-Ci is cool, and so is `nginx`. In here I share some stuff to marry
  the two and let your CI scripts use `nginx` during testing.
address: "Menlo Park, CA"
tags:
- "software engineering"
read:	2015-11-01
published: true
image: https://c2.staticflickr.com/8/7270/7018342079_9271fec335_b.jpg
keywords:
- programming
- development
- ruby
ads:
spellcheck-allow:
- repo
- UID
- github
- nginx
- exratione
---

[Travis Ci](http://www.travis-ci.org) is one of the most essential tools for
my projects, since it takes a burden of maintaining Jenkins away of me. I
try to use Travis automation for every boring activity, and having it run
after each source code change to do some basic tests saves me a lot of time.

Making things work in Travis is typically straightforward, but there are
cases where a special configuration needs to be applied, since the new
Travis is based on the container-based architecture. This poses some
requirements: no `root` access and no `sudo` functionality for your setup
scripts. Some software doesn't like that.

[My website's repo](http://github.com/wkoszek/me) is an example where I
needed to use `nginx` for some local testing. For some reason `nginx`,
instead of just using `/var/tmp`, tries to create its temporary files in
`/var/run` directory, and we don't have the permission to this directory in
a container. So I changed these paths to use `/tmp` together with
`access_log` and `error_log` paths; website content lives in `/tmp/www`.

Even with these changes, I haven't managed to achieve warning-free start. As
non-zero UID, it seems like `nginx` never cleanly starts:

	nginx: [alert] could not open error log file: open()
	"/var/log/nginx/error.log" failed (13: Permission denied)

(Its `-p` flag to change a prefix sounded promising, but it seemed to have
no effect on any of the paths which caused me problems)

## nginx installation

On the old Travis infrastructure one could use `apt-get` run as a part of
`script:` directive, but the container-based Travis requires following lines
in `.travis.yml` to install `nginx` package:

	addons:
	  apt:
	    packages:
	    - nginx

## nginx config

~~~nginx
worker_processes 10;
pid /tmp/nginx.pid;

error_log /tmp/error.log;

events {
	worker_connections 768;
}

http {
	client_body_temp_path /tmp/nginx_client_body;
	fastcgi_temp_path     /tmp/nginx_fastcgi_temp;
	proxy_temp_path       /tmp/nginx_proxy_temp;
	scgi_temp_path        /tmp/nginx_scgi_temp;
	uwsgi_temp_path       /tmp/nginx_uwsgi_temp;

	server {
		listen 8888 default_server;

		root /tmp/www;
		index index.html index.htm;

		server_name localhost;
		location / {
			try_files $uri $uri/ =404;
			autoindex on;
		}
		error_log /tmp/error.log;
		access_log /tmp/access.log;
	}
}
~~~

[Click to download via GitHub Gist](https://gist.github.com/wkoszek/f72b8eb36e02d07adc81)

# Starting/stopping nginx

To start:

	nginx -c `pwd`/etc/nginx.conf

To stop:

	nginx -c `pwd`/etc/nginx.conf -s stop

## References

I use a block of `_temp_path` directives from this very useful repository:

[https://github.com/exratione/non-root-nginx](https://github.com/exratione/non-root-nginx)
