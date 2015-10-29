# Wojciech's website

My website is built with [Middleman](http://www.middlemanapp.com)

To see which extension I use, take a look at the `Gemfile`. Everything there
starting with a `middleman-` prefix is a Middleman plugin. Each plugin comes
with its own documentation, and I don't discuss the details of this here.

# Dependencies 

Install following programs to save yourself a hassle later:

	sudo brew update
	sudo brew install qt advancecomp gifsicle jhead jpegoptim jpeg optipng pngcrush pngquant

	sudo gem install middleman
	sudo gem install capybara
	sudo pip install linkchecker
	bundle install

The last comment will get Bundler to install dependencies for you.

# How to use this project

Provided is a simple `makefile`, which I use all the time:

	make b

to build the website, but most often just:

	make

to get `middleman serve` running (local HTTP server). Middleman monitors the
files which changed and regenerates them. I use it to spot problems with my
articles, and I change them and observe changes live. This feature is
provided thanks to `middleman-live-reload` plugin.

# How to test

For testing you must have [Vagrant](https://www.vagrantup.com/) installed.
On MacOSX:

	brew install vagrant

On Ubuntu:

	apt-get install vagrant

Testing is provided with Selenium. You should be able to do:

	make doit

This will:

- spin up a VM with nginx
- serve the content of the website
- use linkchecker against the `nginx` running in the VM to validate
  correctness of all the links
- will visit each link and validate that it's fine (doesn't contain any
  un-rendered HTML tags)

TODO: More work is needed to make testing easier.

# Developer details: Makefile flow

Makefile drives the build and testing. Order:
- Render everything with Middleman
- Start the VM with Vagrant
- Start the HTTP server in the VM
- Test the website. Will check availability of the links with
  ``linkchecker''. This simulates potential user behavior or
  mirroring etc.
- Take logs from HTTP and re-play them via Capybara. This will
  render all user-visible websites to PNG files.

# Author

- Wojciech Adam Koszek, [wojciech@koszek.com](mailto:wojciech@koszek.com)
- [http://www.koszek.com](http://www.koszek.com)
