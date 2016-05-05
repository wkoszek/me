#!/usr/bin/env ruby

require 'yaml'

in_fn = ARGV[0]

data = []
File.open(in_fn, "r") do |f|
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

print "# " + front_data["title"] + "\n\n"
print " "
print content
