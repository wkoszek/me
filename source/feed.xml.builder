xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  site_url = "http://www.koszek.com/"
  xml.title "Wojciech Adam Koszek"
  xml.subtitle "Software. Business. Design."
  bwk = blog("wkoszek")
  xml.id URI.join(site_url, bwk.options.prefix.to_s)
  xml.link "href" => URI.join(site_url, bwk.options.prefix.to_s)
  xml.link "href" => URI.join(site_url, current_page.path), "rel" => "self"
  xml.updated(bwk.articles.first.date.to_time.iso8601) unless bwk.articles.empty?
  xml.author { xml.name "Wojciech Adam Koszek" }

  bwk.articles[0..15].each do |article|
    xml.entry do
      xml.title article.title
      xml.link "rel" => "alternate", "href" => URI.join(site_url, article.url)
      xml.id URI.join(site_url, article.url)
      xml.published article.date.to_time.iso8601
      xml.updated File.ctime(article.source_file).iso8601
      xml.author { xml.name "Wojciech Adam Koszek" }
      # xml.summary article.summary, "type" => "html"
      xml.content article.body, "type" => "html"
    end
  end
end
