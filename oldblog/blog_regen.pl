#!/usr/bin/perl

# Terrible mess. Just to see if blogging is for me.

use strict;
use warnings;
use warnings FATAL => qw( all );

local $\ = "\n";

my	$g_fn_markdown = "./Markdown.pl";
my	$g_fn_template = "template.html";
my	$g_tmp_dir = "$ENV{HOME}/_.tmp";
my	$g_debug = 0;

sub
dbg
{
	if ($g_debug == 0) {
		return;
	}
	print STDERR @_;
}

sub
try_resolve
{

	return $_;
}

sub
fileread
{
	my ($fn) = @_;

	open(MYFFF, "<$fn") or die "$!: $fn";
	my @lines = <MYFFF>;
	close(MYFFF);

	return @lines;
}

sub
get_title
{
	my	($fn) = @_;
	my	(@lines);

	@lines = fileread($fn);
	chomp $lines[0];	# title

	return $lines[0];
}

sub
regen
{
	my ($fn_in, $fn_out, $out_dir, $title) = @_;

	# For normal posts (articles) take a title from a document.
	# For main pages (front-matter) take Title from the function arg.
	if (!defined($title)) {
		$title = get_title($fn_in);
	}

	dbg "FN_IN: $fn_in FN_OUT: $fn_out OUT_DIR: $out_dir";

	my $line;
	my %article;

	open(ARTICLE, "<$fn_in") or die "$! $fn_in";
	my $article_part = "BODY";
	while ($line = <ARTICLE>) {
		if ($line =~ /^@@@(.*)@@\@$/) {
			$article_part = $1;
			next;
		}
		$article{$article_part} .= $line;
	}
	close(ARTICLE);

	# HACK make tmp. files for chunks of article, so that we can easily
	# HACK pre-parse it. Mostly because creating bidirectional
	# HACK communication in Perl is a lot of code.
	system("mkdir -p $g_tmp_dir");
	system("rm -rf $g_tmp_dir/*");
	foreach my $article_part (keys %article) {
		open(PART, ">$g_tmp_dir/$article_part") or
				die "$! can create $g_tmp_dir/$article_part";
		print PART $article{$article_part};
		close(PART);
	}

	my %article_final;
	foreach my $article_part (keys %article) {
		system("$g_fn_markdown $g_tmp_dir/$article_part > $g_tmp_dir/${article_part}.parsed");
		my @lines = fileread("$g_tmp_dir/${article_part}.parsed");
		@{$article_final{$article_part}} = @lines;
	}

	open(F, "<$g_fn_template") or die "$!";
	my @template = map {
		if ($_ =~ /%%CONTENT%%/) {
			@{$article_final{BODY}}
		} else {
			$_;
		}
	} <F>;
	close(F);

	print "$fn_out";

	open(F, ">$fn_out") or die "$!";
	foreach my $line (@template) {
		chomp $line;
		if ($line =~ /%%MENU%%/) {
			print F "<a href=\"http://www.koszek.com\"/>BLOG</a>";
			print F "<br>";
			print F "<br>";

			print F "<a href=\"http://www.koszek.com/books.html\"/>BOOKS</a>";
			print F "<br>";
			print F "<br>";

			print F "<a href=\"http://www.koszek.com/software.html\"/>SOFTWARE</a>";
			print F "<br>";
			print F "<br>";

			print F "<a href=\"http://www.koszek.com/papers.html\"/>PAPERS</a>";
			print F "<br>";
			print F "<br>";

#			print F "<a href=\"http://www.koszek.com/atom.xml\"/>RSS</a>";
#			print F "<br>";
#			print F "<br>";
		} elsif ($line =~ /%%ADDS%%/ and $fn_out ne "./index.html") {
			#print "OUT_DIR = $out_dir";
			my @fn_ads = sort glob "$out_dir/ad_*";
			#print "FN_ADS = @fn_ads";
			my @adds;
			foreach my $fn_ad (@fn_ads) {
				my @ad = fileread($fn_ad);
				@adds = (@adds, @ad);
			}
			print F @adds;
			if (defined $article_final{RIGHT}) {
				print F @{$article_final{RIGHT}};
			}
		} elsif ($line =~ /%%TITLE%%/) {
			print F "$title";
		} elsif ($line =~ /.*%%(.*)%%.*/) {
			#print ">>>>>>>> $1";
			if ($fn_out ne "./index.html" and -e $1) {
				my @inc = fileread($1);
				print F @inc;
			}
		} else {
			print F $line;
		}
	}
	close(F);
}

#sub
#gen_rss
#{
#	my @rss;
#	my $hdr = <<________EOF;
#		<?xml version="1.0" encoding="utf-8"?>
#		<feed xmlns="http://www.w3.org/2005/Atom">
#		<title>Wojciech Adam Koszek RSS</title>
#		<link href="http://www.koszek.com/atom.xml" rel="self"/>
#		<link href="http://www.koszek.com/"/>
#		<id>http://www.koszek.com</id>
#		<author>
#		<name>Wojciech Adam Koszek</name>
#		<email>wkoszek\@FreeBSD.org</email>
#		</author>
#________EOF
#	my $foot = <<________EOF;
#		</feed>
#________EOF
#
#
#	$hdr =~ s/\t//g;
#	$foot =~ s/\t//g;
#	push @rss, $hdr;
#	
#	foreach my $file (keys %g_fns) {
#		push @rss, "<entry>\n";
#		push @rss, "<title>$g_fns{$file}</title>\n";
#		push @rss, "<id>$file</id>\n";
#		if ($file =~ /^(\d{4})-(\d{2})-(\d{2})-.*/) {
#			push @rss, "<updated>$1-$2-$3T00:00:00-08:00</updated>\n";
#		}
#		push @rss, "<link href=\"http://www.koszek.com/$1/$2/$3\" />\n";
#		push @rss, "<content type=\"html\" />\n";
#		push @rss, "</entry>\n";
#	}
#
#	push @rss, $foot;
# 
#	open(FN, ">atom.xml") or die "$!";
#	print FN @rss;
#	close(FN);
#}


sub
main
{
	my	(@filelist) = @_;
	my	($title, $date, $date_dir, $out_dir, $fn_out, $article_type, $article_base_name);
	my	(@fns);
	my	$entry;
	my	@entries = ();

	dbg "FILELIST: @filelist";
	foreach my $fn_in (sort(@filelist)) {
		$article_type = undef;
		$fn_out = undef;
		$out_dir = undef;
		if ($fn_in =~ /^(\d{4}-\d{2}-\d{2})-(.*)\.md$/) {
			$date = $1;
			$article_base_name = $2;
			$date_dir = $date;
			$date_dir =~ s,-,/,g;
			$title = get_title($fn_in);
			dbg "DATE: $date DATE_DIR: $date_dir ARTICLE_BASE_NAME: $article_base_name TITLE: $title";
			$entry = ();

			if ($article_base_name =~ /^book/) {
				dbg "BOOK MODE";
				$out_dir = "books/$article_base_name";

				$entry->{hdr} = $date_dir;
				$entry->{date_dir} = $date_dir;		# for sort
				$entry->{href} = $out_dir;
				$entry->{title} = $title;
				$entry->{type} = "book";
				push @entries, $entry;
			} else {
				dbg "NORMAL MODE";
				$out_dir = $date_dir;

				$entry->{hdr} = $date_dir;
				$entry->{date_dir} = $date_dir;		# for sort
				$entry->{href} = $out_dir;
				$entry->{title} = $title;
				$entry->{type} = "normal";
				push @entries, $entry;

			}
			$fn_out = sprintf("%s/index.html", $out_dir);
		}
		if (-s $fn_in > 0) {		# if file size > 0
			if (defined $out_dir && defined $fn_out) {
				system("mkdir -p $out_dir");
				regen($fn_in, $fn_out, $out_dir, undef);
			}
			#regen($fn_in, "wip/$fn_in.html", "wip/");
		}
	}
	regen_index("Blog", "index", "normal", \@entries);
	regen_index("Books", "index_books", "book", \@entries);
	regen("index", "index.html", ".", "Homepage");
	regen("index_books", "books.html", ".", "Books");
	regen("papers.md", "papers.html", ".", "Papers");
	regen("software.md", "software.html", ".", "Software");
}

sub
regen_index
{
	my ($title, $fn_index, $type2gen, $entries_ref) = @_;
	my @entries = @{$entries_ref};
	my $entry;

	dbg "TITLE: $title FN_INDEX: $fn_index TYPE2GEN: $type2gen";

	open(F, ">$fn_index") or die "$!";
#	print F "$title";
#	print F "-------------------";

	foreach $entry (reverse sort {$a->{date_dir} cmp $b->{date_dir}} @entries) {
		my ($hdr, $href, $title, $type) = ($entry->{hdr},
				$entry->{href}, $entry->{title}, $entry->{type});
		dbg "HDR: $hdr HREF: $href TITLE: $title TYPE: $type";
		if ($type2gen eq $type) {
			#print "GENERATING!!";
			#print F "*$hdr* <tt>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</tt> [**$title**]($href)\n"
			print F "[**$title**]($href) &nbsp;&nbsp;<i>(*$hdr*)</i>\n"
		}
	}
	close F;
}

#while ($#ARGV) {
#	my $arg = $ARGV[0];
#	if ($arg =~ /^-filelist/) {
#}

my $argc = scalar(@ARGV);
if ($argc == 0) {
	print "usage:";
	print "\tblog_regen.pl <file> [<file2> ...]";
	exit 1;
}

main(@ARGV);

#gen_rss;
