require 'nokogiri'
require_relative 'listing_scraper'
require_relative 'listing_info'
include HousingListingScraper

class PadmapperScraper < ListingScraper

    PADMAPPER_BASE_URL = "https://www.padmapper.com"

    def get_search_url()
        return PADMAPPER_BASE_URL + "/apartments/boston-ma/downtown-boston"
    end

    def get_listing_URLs_from_search_html(search_html)
        doc = Nokogiri::HTML(search_html)
        listing_urls = []
        doc.css("div.address").each do |item|
            relative_url = item.at_css("a")[:href]
            listing_urls.push(PADMAPPER_BASE_URL + relative_url)
        end
        return listing_urls
    end

    def parse_listing_html(listing_html)

        doc = Nokogiri::HTML(listing_html)

        # Some page types have descriptions in the pre element, others are in a div description class
        pre_element = doc.at_css("pre")
        div_description = doc.at_css("div.description")
        if pre_element
            description = pre_element.text
        elsif div_description
            description = div_description.text
        else
            # These seem to be airbnb listings.
            description = "No description found!"
        end

        address = doc.at("meta[name='place:street_address']")['content']
        zip_code = doc.at("meta[name='place:postal_code']")['content']
        latitude = doc.at("meta[name='place:location:latitude']")['content']
        longitude = doc.at("meta[name='place:location:longitude']")['content']
        return ListingInfo.new(description, address, zip_code, latitude, longitude)
    end

    def get_site_name()
        "Padmapper"
    end
end
