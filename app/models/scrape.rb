class Scrape < ApplicationRecord

  def self.scrape
    # page = HTTParty.get('https://boston.craigslist.org/search/aap')

    page = HTTParty.get('https://data.cambridgema.gov/resource/wrqt-2qw9.json')
    parse_page = Nokogiri::HTML(page)
    parse_page.css()
binding.pry

    # url_id:       parse_page.css('a.result-title.hdrlnk').first.attributes
    # https://boston.craigslist.org/gbs/fee/6024170446.html
    # title:        parse_page.css('.result-title').first.text
    # price:        parse_page.css('.result-price').first.text
    # heading:      parse_page.css('.result-row')
    # neighborhood: parse_page.css('.result-hood').first.text
  end

  def find_phrases_in_descriptions
    # assign local variable of type 'array', to the csv file of 'keywords'  
    @phrases = #text file in csv format
    # get a group of listings  
    @listings = Listing.all.where(listing_id<100)
    # iterate through the group
    # assign a local variable to the 'description' field
    # 
    # parse each word in text file 
    # 
  end   

end
