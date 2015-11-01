# Personal website of Wojciech Koszek

My website is built with [Middleman](http://www.middlemanapp.com) and
various plugins. They let me publish blog articles, keep drafts of articles
which aren't yet finished, minify the HTML, Javascript and CSS files as well
as deploy to GitHub Pages. After each website rendering, the sitemap gets
updated and popular search engines are being pinged about the sitemap
update. Images present on the website are optimized with ImageOptim, and
articles are checked with the spell-checker. During development LiveReload
extension causes instant feedback (refresh) after each file's change.

Website is tested with Capybara, which uses Selenium as a testing framework.
To obtain interesting/visible links, I use `linkchecker`. It also warns me
about incorrect links, if any. The feedback from `linkchecker` is then used
to do some browser-based tests. Currently I use RSpec script from `spec/` to
visit the links and see if they have some content I'd expect (title, menu,
unrendered HTML). If those assertions fail, the whole website build fails
too.

Inspect `Gemfile` for details.

# Dependencies 

Install following programs to save yourself a hassle later:

	sudo brew update
	sudo brew install qt advancecomp gifsicle jhead jpegoptim jpeg optipng pngcrush pngquant
	sudo brew install nginx linkchecker

	apt-get install ruby1.9.1-dev
	sudo gem install middleman
	sudo gem install capybara
	sudo pip install linkchecker
	gem install bundle
	bundle install

The last comment will get Bundler to install dependencies for you.

# How to use this project

Everything is driven by a `makefile` and performing calls to `make`. To
understand what each command does, take a look at the `makefile`.

To start the local server and get a local preview of the project, type:

	make

After this test Middleman will print the URL to access on the standard
output. You can access it with your browser, and any changes should result
in an automatic refresh.

To render the whole website to `build/` directory type:

	make render

# How to test

To test you must have a `nginx` installed. Testing is provided with
Selenium. You should be able to do:

	make doit

This will:

- start nginx HTTP server for you
- do a link testing with `linkchecker`
- do a test with Selenium accessing discovered links

# Author

- Wojciech Adam Koszek, [wojciech@koszek.com](mailto:wojciech@koszek.com)
- [http://www.koszek.com](http://www.koszek.com)
