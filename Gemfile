# If you do not have OpenSSL installed, change
# the following line to use 'http://'
source 'https://rubygems.org'

# For faster file watcher updates on Windows:
gem 'wdm', '~> 0.1.0', platforms: [:mswin, :mingw]

# Windows does not come with time zone data
gem 'tzinfo-data', platforms: [:mswin, :mingw, :jruby]

# Middleman Gems
gem 'middleman', '>= 4.0.0'
gem 'middleman-livereload'

gem "middleman-blog"
#gem 'middleman-blog-similar'
gem "middleman-minify-html"
gem "middleman-deploy", '~> 2.0.0.pre.alpha'
gem "middleman-gh-pages"
gem "middleman-syntax"
gem 'middleman-imageoptim'
gem 'middleman-search_engine_sitemap'
gem 'middleman-sitemap-ping'
gem 'middleman-build-reporter'

## Let me do spellcheck development easily.
#if ENV.include?("DEV") then
#  File.delete("middleman-spellcheck")
#  File.symlink("../middleman-spellcheck", "middleman-spellcheck")
#  gem "middleman-spellcheck", '~> 0.9.2', :path => "middleman-spellcheck"
#else
#  gem "middleman-spellcheck", '~> 0.9.2',
#	:git => "https://github.com/wkoszek/middleman-spellcheck.git",
#	:branch => "nil_words_fix"
#end

# HTML/CSS stuff.
gem 'bourbon'

# Testing
gem 'capybara'
gem 'selenium-webdriver'
gem "chromedriver-helper", "0.0.6"
gem 'rspec'		# spec/ requirement
gem 'rspec-core'	# spec/ requirement
gem 'poltergeist'

# For feed.xml.builder
gem "builder"
