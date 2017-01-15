#!/usr/bin/env ruby

require 'fileutils'
require 'pathname'
require 'pp'

unless ARGV.length == 2 then
	print "add_img <img_file> <post_file>\n"
	exit
end

img_fn = ARGV[0]
img_basename = Pathname.new(img_fn).basename.to_s
img_no_ext = img_basename.split('.')[0]
ext = img_basename.split('.')[1]
#print "IMG_FN #{img_fn}\n"
#print "IMG_BASENAME #{img_basename}\n"
#print "IMG_NO_EXT #{img_no_ext}\n"

post_fn = ARGV[1]
unless File.exist?(post_fn) then
	print "Post file #{post_fn} doesn't exist\n"
	exit
end

md_file_name = post_fn.split("/")[-1]
md_file_name.gsub!(/\.html.md$/, "")
img_path = "source/img/#{md_file_name}/"

unless File.exists?(img_path) then
	Dir.mkdir(img_path)
end

print "# #{md_file_name} #{img_path}\n"

img_scales = [5, 10, 15 ] # in percent of original
img_scales.each do |s|
	print "# scaling #{s}\n"
	`convert -type Grayscale -resize #{s}% #{img_fn} #{img_path}/#{img_no_ext}_#{s}p.#{ext}\n`
end

File.open(post_fn, 'a') { |f|
	Dir["#{img_path}/*"].each_with_index do |dir_entry, dei|
		dir_entry.gsub!(/^source/, "")
		dir_entry.gsub!("//", "/")
		f.write("![alt_text_#{dei}](#{dir_entry} \"Image_text_#{dei}\")\n")
	end
}
