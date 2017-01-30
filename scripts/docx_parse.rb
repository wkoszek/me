#!/usr/bin/env ruby

require 'docx'
require 'pp'

doc = Docx::Document.open('_.docx')

title = nil
doc.paragraphs.each do |p|
	if title == nil then
		title = p
		next
	end
	print p.to_html
	print "\n\n"
end

print "sample bookmarks"
doc.bookmarks.each_pair do |bookmark_name, bookmark_object|
	puts bookmark_name
end

doc.bookmarks.each_pair do |bookmark_name, bookmark_object|
	puts bookmark_name
end
