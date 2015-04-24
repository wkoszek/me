#!/usr/bin/env python
# Copyright (c) 2014 Wojciech A. Koszek <wkoszek@FreeBSD.org>

import	re
import	os, os.path
import	sys
import	glob
import	getopt

g_verbose = False
g_dir = "."
g_entries = []

class Golb:
	fn = None
	y = None
	m = None
	d = None
	n = None

	def __init__(self, fn, y, m, d, n):
		self.fn = fn
		self.y = y;
		self.m = m;
		self.d = d;
		self.n = n
	def dump(self):
		print "Y,M,D={0},{1},{2},{3} [fn={4}]".format(
			self.y, self.m, self.d, self.n, self.fn
		)

def main():
	
	try:
		optlist, args = getopt.getopt(sys.argv[1:], "vd:");
	except getopt.GetoptError as err:
		usage()
		sys.exit(2)

	for o, a in optlist:
		if o == "-v":
			g_verbose = True
		elif o == "-d":
			g_dir = a
		else:
			assert False, "unhandled option"

def usage():
	print "usage"

def get_title(fn):
	with open(fn, "r") as f:
		content = f.read().split("\n");
	f.close();
	return content[0];

def start():
	print "# start(), g_dir='{0}'".format(g_dir)
	# Get .md files
	fnlist_raw = reversed(sorted(map(os.path.basename, glob.glob(g_dir +
	"/*.md"))))
	# Filter those that start with a date. Other files are junk
	rege = re.compile("^(\d{4})-(\d{2})-(\d{2})-(.*)\.md")
	# Make a list of matching objects
	fn_matched = [m for m in map(rege.match, fnlist_raw) if m != None ]
	# Sp
	for [fn, groups] in [[m.string, m.groups()] for m in fn_matched]:
		[year, month, day, name] = groups;
		g_entries.append(Golb(fn, year, month, day, name));

def regen_index(hdr, outfn, entries, qualifier):
	with open(outfn, "w") as f:
		f.write(hdr + "\n------------------\n");
		for x in entries:
			if qualifier(x) == False:
				continue
			title = get_title(x.fn);
			date = x.y + "/" + x.m + "/" + x.d;
			f.write("*{0}* <tt>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</tt>\
				[**{1}**]({2})\n".format(date, title, date));

if __name__ == "__main__":
	main();
	start();
	regen_index("Blog", "index", g_entries,
		lambda m: re.match("^((?!-book-).)*$", m.fn) != None);
#	regen_index("Books", g_entries);
