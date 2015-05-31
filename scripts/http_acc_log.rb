#!/usr/bin/env ruby
# Copyright 2015 Wojciech Adam Koszek <wojciech@koszek.com>

class HTTPAccLog
	def initialize(fn)
		@fn = fn
		@urls = Hash.new
		@urls_regex_skip = Hash.new
	end

	def parse
		fp = File.open(@fn, "r")
		fp.each do |line|
			toks = line.split(" ")
			url = toks[6]
			@urls[url] = 1;
			#print toks[6], "\n"
		end
	end

	def skip_url(*args)
		args.each { |a|
			@urls_regex_skip[a] = 1
		}
	end

	def urls
		urls_done = []
		@urls.keys.each { |url|
			matched = 0
			@urls_regex_skip.keys.each { |url_regex_skip|
				matched += 1 if url =~ /#{url_regex_skip}/
			}
			#print "url #{url} matched: #{matched}\n"
			urls_done << url if matched == 0
		}
		urls_done
	end
end
if __FILE__ == $0
	l = HTTPAccLog.new("../tmp/access.log")
	l.parse()
	l.skip_url(
		"css$", "xml$", "txt$", "ico$", "//",
		"[pP][dD][Ff]$", "[Jj][pP][gG]$"
	)

	num = 0
	l.urls.each { |u|
		#print "#{num}\t#{u}\n"
		print "#{u}\n"
		num += 1
	}
end
