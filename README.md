# Wojciech's website

Dependencies:

	gem install middleman
	gem install capybara
	pip install linkchecker

	brew update
	brew install qt

# Makefile flow

Makefile drives the build and testing. Order:
- Render everything with Middleman
- Start the VM with Vagrant
- Start the HTTP server in the VM
- Test the website. Will check availability of the links with
  ``linkchecker''. This simulates potential user behavior or
  mirroring etc.
- Take logs from HTTP and re-play them via Capybara. This will
  render all user-visible websites to PNG files.
