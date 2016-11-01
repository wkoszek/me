#!/usr/bin/env ruby

# Copyright 2016 Wojciech Adam Koszek <wojciech@koszek.com>
# This script takes a static .md files with yaml frontmatter, take the data
# there and validate the content there according to my own standards.

require 'yaml'

def process_one(fin_name)
	data = []
	File.open(fin_name, "r") do |f|
		data = f.read()
	end

	marker_found_times = 0
	will_add_to_frontmatter = 1
	frontmatter = ""
	content = ""
	data.split("\n").each do |line|
		if line =~ /^---/ then
			marker_found_times += 1
			next
		end
		if marker_found_times == 2 then
			will_add_to_frontmatter = 0
			marker_found_times = -1
			next
		end

		if will_add_to_frontmatter == 1 then
			frontmatter += line + "\n"
		else
			content += line + "\n"
		end
	end

	#print "FRONT\n\n", frontmatter
	#print "CONTENT\n\n", content

	front_data = YAML.load(frontmatter)
	return front_data
end

def validate_one(data, file)
	rc = 0

	if not data.include?("abstract") then
		print "# doesn't have 'abstract' keyword"
		rc += 1
	else
		abs = data["abstract"]
		if abs == nil then
			print "# #{file} doesn't have abstract!\n"
			rc += 1
		elsif abs.length <= 0 then
			printf "# WARN %s %d\n", file, abs.length
			rc += 1
		end
	end

	# must have address (maybe change to where?)
	# must have author
	# must have title
	# must have tags
	# must have layout

	if file =~ /book/ then
		# must have auth
		# must have read
	end

	return rc
end

result_sum = 0
ARGV.each do |file|
	data_one = process_one(file)
	result = validate_one(data_one, file)
	result_sum += result
end

exit result_sum
