#!/usr/bin/env ruby
# Copyright 2017 Wojciech Adam Koszek <wojciech@koszek.com>

# Script to insert a line into a file
# because I hate sed 'i' syntax

require 'pp'

if ARGV.length < 3
  STDERR.puts "./add_field.rb <search_line> <to_insert> file [file2 ...]"
  exit
end

search_term = ARGV[0]
header = ARGV[1]

ARGV[2..-1].each do |arg|
  lines = File.readlines(arg)
  #pp lines
  lines.each_with_index do |line,index|
    if line =~ /#{search_term}/
      lines.insert(index + 1, header + "\n")
    end
  end
  #pp lines
  File.write(arg, lines.join)
end
