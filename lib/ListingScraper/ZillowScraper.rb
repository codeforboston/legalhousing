require 'rubygems'
require 'nokogiri'
require 'httparty'
require 'openssl'


ZILLOW_BASE_ADDRESS = "https://www.zillow.com"


def get_zillow_listing_info(listing_url) 
    puts listing_url
end

def get_zillow_home_detail_links_from_group_listing(group_listing_url)
    page = HTTParty.get(group_listing_url)
    doc = Nokogiri::HTML(page)
    
    listing_urls = []
    doc.css("span.individual-unit-price a").each do |item|
        listing_urls.push(item[:href])
    end
    return listing_urls
end

def get_zillow_listing_infos_from_search_url(search_url)
    page = HTTParty.get(search_url)
    doc = Nokogiri::HTML(page)

    # Get URL for each listing
    all_listing_urls = []
    doc.css("a.hdp-link").each do |item|
        all_listing_urls.push(item[:href])
    end

    # Break out grouped listings into individual apartment listings
    listing_urls, group_listing_urls = all_listing_urls.partition { |url| url.include? "homedetail"}
    group_listing_urls.each do |group_listing_url|
        group_listing_full_url = ZILLOW_BASE_ADDRESS + group_listing_url
        listing_urls.concat get_zillow_home_detail_links_from_group_listing(group_listing_full_url)
    end

    # Get info for each listing
    listing_urls.each do |listing_url|
        get_zillow_listing_info(listing_url)
    end
    
end


search_url = ZILLOW_BASE_ADDRESS + "/homes/for_rent/Boston,-MA_rb"
get_zillow_listing_infos_from_search_url(search_url)