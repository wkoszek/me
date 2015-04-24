#!/usr/bin/perl
#
# Copyright (c) 2013 Wojciech A. Koszek <wkoszek@freebsd.czest.pl>
#
use	strict;
use	warnings;

my	@files = grep { /^2.*\.md$/ } <*.md>;

foreach my $file (@files) {
	unless ($file =~ /^(\d{4})-(\d{2})-(\d{2})-(.*)\.md$/) {
		next;
	}
	my	$year = $1;
	my	$month = $2;
	my	$day = $3;
	my	$name = $4;
	if ($name =~ /^book/) {
		print "OBJ+=	books/$name/index.html\n";
	} else {
		print "OBJ+=	$year/$month/$day/index.html\n";
	}
}

print "\n";
print "all: \${OBJ}\n";
print "\n";

foreach my $file (@files) {
	unless ($file =~ /^(\d{4})-(\d{2})-(\d{2})-(.*)\.md$/) {
		next;
	}
	my	$year = $1;
	my	$month = $2;
	my	$day = $3;
	my	$name = $4;

	if ($name =~ /^book/) {
		print "books/$name/index.html: $file\n";
	} else {
		print "$year/$month/$day/index.html: $file\n";
	}
	print "\t./blog_regen.pl $file\n";
}
