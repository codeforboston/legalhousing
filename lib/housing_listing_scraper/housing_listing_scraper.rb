require 'httparty'
require_relative 'padmapper_scraper'
require_relative 'listing_info'

module HousingListingScraper
    @@scrapers = [PadmapperScraper.new]

    # Runs a scraper on each site and returns an array
    # of ListingInfo structs
    def HousingListingScraper.run_scrapers()
        listing_infos = []

        @@scrapers.each do |scraper|
            search_url = scraper.get_search_url()
            search_html = HTTParty.get(search_url)
            listing_urls = scraper.get_listing_URLs_from_search_html(search_html)

            listing_urls.each do |listing_url|
                listing_html = HTTParty.get(listing_url)
                listing_info = scraper.parse_listing_html(listing_html)
                listing_infos.push(listing_info)
            end

        end

        return listing_infos
    end

end
