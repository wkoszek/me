#!/usr/bin/env ruby
# Copyright (c) 2016 Wojciech Adam Koszek <wojciech@koszek.com
#
# Just make a simple check whether the Yaml is correct enough to
# be readable by the Ruby YAML module.

require 'YAML'
require 'pp'

if ARGV.length() < 1 then
  print "pass filename [filename2 ...]\n"
  exit 1
end

ARGV.each do |input_filename|
  begin
    file_desc = File.open(input_filename)
    raw_data = file_desc.read()
    file_desc.close()
    yaml_data = YAML.load(raw_data)
#   pp yaml_data
  rescue Exception => e
    print "error: #{e} file #{input_filename}\n"
    exit 1
  end
end
exit 0
