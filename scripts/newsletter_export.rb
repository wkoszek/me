#!/usr/bin/env ruby

require 'mailchimp'
require 'pp'

config_file_path = "#{ENV["HOME"]}/.mailchimp.rb"
if not File.exist?(config_file_path)
  print "You must define MAILCHIMP_API_KEY and MAILCHIMP_LIST_ID\n"
  print "Put them in #{config_file_path}\n"
  exit
end

require config_file_path

mailchimp = Mailchimp::API.new(MAILCHIMP_API_KEY)
members = mailchimp.lists.members(MAILCHIMP_LIST_ID)['data']

emails = members.collect{|m| m["email"] }
print emails.join(","), "\n"
