###
# Blog settings
###

tgt_env_var = "TGT_KOSZEK_COM"
tgt = ENV[tgt_env_var].to_s.downcase
is_prod = (tgt == "production")

def dbg(*args)
  print "# KC "
  args.each do |a|
    print a
  end
  print "\n"
end

def get_words_allowed(fn)
  allowed = []
  f = File.open(fn, "r")
  while (line = f.gets)
	if line =~ /^#/ or line =~ /^$/
		next
	end
	allowed << line.strip
  end
  print "== Got allowed: #{allowed}\n"
  allowed
end

dbg("------------ site building started -----------")

# Time.zone = "UTC"

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  blog.prefix = "blog"

  blog.permalink = "{year}/{month}/{day}/{title}.html"
  # Matcher for blog source files
  # blog.sources = "{year}-{month}-{day}-{title}.html"
  # blog.taglink = "tags/{tag}.html"
  # blog.layout = "layout"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  # blog.default_extension = ".markdown"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  # Enable pagination
  # blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/{num}"
end

activate :drafts do |drafts|
  drafts.build = true if not is_prod
  puts "# Build: #{drafts.build}"
end

page "/feed.xml", layout: false

ignore /papers_new*/
ignore "spec/*"
ignore "/data/*"
ignore "scripts/*"

ignore "/articles/*"

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", layout: false
#
# With alternative layout
# page "/path/to/file.html", layout: :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
activate :livereload
activate :directory_indexes
activate :syntax
activate :graphviz
#activate :spellcheck
activate :spellcheck,
		page: "blog/*",
		tags: [ :p, :article ],
		lang: :en_CA,
		debug: 0,
		dontfail: 1,
		allow: get_words_allowed("./data/words_allowed.txt"),
		ignored_exts: [".jpg", ".png", ".pdf",
			".sh", ".ico", ".xml", ".woff",
			".eot", ".ttf", "*.otf",
			".txt", "CNAME",
			"/papers/", "/software/"
		]

# Fix quotes: https://github.com/middleman/middleman/issues/909
set :markdown_engine, :kramdown
set :markdown, :smartypants => true

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'css'

set :js_dir, 'js'

set :images_dir, 'img'

# Build-specific configuration
configure :build do
  if is_prod then
    dbg("production build!")

    # For example, change the Compass output style for deployment
    dbg("...will minify CSS")
    activate :minify_css

    # Minify Javascript on build
    dbg("...will minify Javascript")
    activate :minify_javascript

    # Minify Javascript on build
    dbg("...will minify HTML")
    activate :minify_html
  else
    dbg("development build!!!")
  end

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

