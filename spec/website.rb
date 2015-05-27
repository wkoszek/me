require 'capybara/rspec'

Capybara.run_server = false
Capybara.current_driver = :selenium
Capybara.app_host = 'http://127.0.0.1:4567/'

describe "basic links", :type => :feature do
	it "basic links" do
		[
		 ["Wojciech Adam Koszek", "Writing helps me collect"],
		 ["Blog", "Writing help me collect"],
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
			expect(page).to have_content 
		end
	end
end
