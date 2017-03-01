class Scrape < ApplicationRecord

  def self.scrape_data
    page = HTTParty.get('https://boston.craigslist.org/search/aap')
    parse_page = Nokogiri::HTML(page)
    parse_page.css('.result-row')
binding.pry

    # url_id:       parse_page.css('a.result-title.hdrlnk').first.attributes
    # https://boston.craigslist.org/gbs/fee/6024170446.html
    # title:        parse_page.css('.result-title').first.text
    # price:        parse_page.css('.result-price').first.text
    # heading:      parse_page.css('.result-row')
    # neighborhood: parse_page.css('.result-hood').first.text
  end

end
