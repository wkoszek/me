#!/usr/bin/env ruby

require 'yaml'
require 'pp'

d = YAML.load(File.read("desc.yml"))

print YAML.dump(d)

#File.write("wojtek", YAML.dump(d))

