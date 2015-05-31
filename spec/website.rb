require 'capybara/rspec'
load 'scripts/http_acc_log.rb'

Capybara.run_server = false
Capybara.current_driver = :selenium
Capybara.app_host = 'http://127.0.0.1:8123/'

#Capybara.register_driver :selenium do |app|
#	Capybara::Selenium::Driver.new(app, :browser => :chrome)
#end

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
		page.driver.browser.manage.window.maximize

		#window = Capybara.current_session.driver.browser.manage.window
		#window.resize_to(1600, 1200) # width, height

		l = HTTPAccLog.new("tmp/access.log")
		l.parse()
		l.skip_url(
			"css$", "xml$", "txt$", "ico$", "//",
			"[pP][dD][Ff]$", "[Jj][pP][gG]$",
			"woff$", "eot$"
		)

		num = 0
		l.urls.each do |url|
			print "# testing #{url}"
			visit "#{url}"
			expect(page).to have_content "Wojciech Adam Koszek"
			page.save_screenshot("tmp/#{num}.png")
			num += 1
		end
	end
end
