#!/usr/bin/env ruby

require 'yaml'

BLOG_DIR = "../blog"
EXT = ".html.md"
BASE_URL = "https://www.koszek.com/blog"

def main
  all_matched = []
  ARGV.each do |arg|
    all_matched += list_matched_filenames(arg)
  end
  all_yaml = generate_yaml_array(all_matched)
  yaml_to_mailing_list(all_yaml)
end

def list_matched_filenames(month)
  pat = "#{BLOG_DIR}/2017-#{month}-*#{EXT}"
  return Dir.glob(pat).sort
end

def generate_yaml_array(filenames)
  yaml_files = []
  filenames.each do |filename|
    data_raw = File.read(filename)
    yaml_file_raw = YAML.load(data_raw)
    yaml_file_raw["filename"] = filename
    yaml_files << yaml_file_raw
  end
  yaml_files
end

def yaml_to_mailing_list(yaml_files)
  yaml_files.each do |y|
    title, filename, maillist = y["title"], y["filename"], y["maillist"]
    md_link = mdlink(title, make_url_from_filename(filename))

    print "# #{filename}\n"
    print "- #{md_link} #{maillist}\n\n"
  end
end

def make_url_from_filename(filename_raw)
  filename = filename_raw.gsub("#{BLOG_DIR}/", "")
  chunks = filename.split("-")
  year, month, day = chunks[0], chunks[1], chunks[2]

  front_offset = "1900-01-01".length + 1
  back_offset = EXT.length + 1
  filename_nodate_noext = filename[front_offset..-back_offset] 
  return "#{BASE_URL}/#{year}/#{month}/#{day}/#{filename_nodate_noext}/"
end

def mdlink(desc, link)
  "[#{desc}](#{link})"
end

main

