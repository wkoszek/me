require 'capybara/rspec'
require 'capybara/poltergeist'
load 'scripts/http_acc_log.rb'

is_headless = false	# headless?
["TRAVIS", "CIRCLE", "TEST_CI"].each do |ci|
	if ENV.has_key?(ci) then
		print "CI system detected #{ci}\n"
		is_headless = true
	end
end

Capybara.run_server = false
Capybara.app_host = 'http://127.0.0.1:8888/'

driver = nil
if is_headless then
	options = { :js_errors => false	}
	driver = :poltergeist
	Capybara.register_driver :poltergeist do |app|
		Capybara::Poltergeist::Driver.new(app, options)
	end
else
	options = { :browser => :firefox }
	driver = :selenium
	Capybara.register_driver :selenium do |app|
		Capybara::Selenium::Driver.new(app, options)
	end
end
print "Will use #{driver} driver for testing\n"
print "  options: #{options}\n"

Capybara.javascript_driver = driver
Capybara.default_driver = driver
Capybara.current_driver = driver

g_whitelist = [
"/blog/2015/08/10/non-continuous-innovation-is-dangerous/"
]

describe "basic links", :type => :feature do
	next
	it "basic links" do
		[
		 ["Wojciech Adam Koszek", "Writing helps me collect"],
		 ["Blog", "Writing helps me collect"],
		 ["Reading", "The Billionaire and the Mechanic"],
		 ["Software", "My software"],
		 ["Papers", "Some of my papers"],
		 ["About me", "I was born"]
		].each do |link_desc|
			link = link_desc[0]
			desc = link_desc[1]
			print "# testing #{link} for '#{desc}'\n"
			visit "/"
			click_link "#{link}"
			expect(page).to have_content "#{desc}"
		end
	end
end

describe "visit pages", :type => :feature do
	it "basic links" do
		unless is_headless then
			page.driver.browser.manage.window.maximize
		end

		#window = Capybara.current_session.driver.browser.manage.window
		#window.resize_to(1600, 1200) # width, height

		l = HTTPAccLog.new("/tmp/access.log")
		l.parse()
		l.skip_url(
			"css$", "xml$", "txt$", "ico$", "//",
			"[pP][dD][Ff]$", "[Jj][pP][gG]$",
			"woff$", "eot$"
		)

		num = 0
		l.urls.each do |url|
			if not url =~ /\/$/ then
				print "Not a dir. Skipping\n"
				next
			end
			if g_whitelist.include?(url) then
				print "# Whitelisting: #{url}\n"
				next
			end
			print "# testing: #{url}\n"
			visit "#{url}"
			expect(page).to have_content "Wojciech Adam Koszek"
			expect(page).to have_no_content /src=|iframe=|amazon-adsystem|important:|margin:|height=|width=/
			num += 1
		end
	end
end
