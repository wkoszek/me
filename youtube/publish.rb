#!/usr/bin/env ruby

require 'yaml'
require 'pp'
require_relative 'upload_video.rb'

d = YAML.load(File.read("wkoszek-youtube.yml"))
print YAML.dump(d)

#File.write("wojtek", YAML.dump(d))

