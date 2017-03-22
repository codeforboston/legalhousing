require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'openssl'

PADMAPPER_BASE_URL = "https://www.padmapper.com"
PADMAPPER_LISTING_URL_KEY = "listing_url"
PADMAPPER_LISTING_DESCRIPTION_KEY = "description"
PADMAPPER_LISTING_ADDRESS_KEY = "address"
PADMAPPER_LISTING_ZIPCODE_KEY = "zipcode"
PADMAPPER_LISTING_LATITUDE_KEY = "latitude"
PADMAPPER_LISTING_LONGITUDE_KEY = "longitude"

def get_padmapper_listing_info(listing_url)
    listing_info = {}
    doc = Nokogiri::HTML(open(listing_url, {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}))
    listing_info[PADMAPPER_LISTING_URL_KEY] = listing_url
    listing_info[PADMAPPER_LISTING_DESCRIPTION_KEY] = doc.at_css("pre").text
    listing_info[PADMAPPER_LISTING_ADDRESS_KEY] = doc.at("meta[name='place:street_address']")['content']
    listing_info[PADMAPPER_LISTING_ZIPCODE_KEY] = doc.at("meta[name='place:postal_code']")['content']
    listing_info[PADMAPPER_LISTING_LATITUDE_KEY] = doc.at("meta[name='place:location:latitude']")['content']
    listing_info[PADMAPPER_LISTING_LONGITUDE_KEY] = doc.at("meta[name='place:location:longitude']")['content']
    return listing_info
end

def get_padmapper_listing_info_from_search_url(search_url)
    doc = Nokogiri::HTML(open(search_url, {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}))

    # Get URLs for each listing
    listing_urls = []
    doc.css("ol li").each do |item|
        listing_urls.push(item.at_css("a")[:href])
    end

    # Get info for each listing
    listing_infos = []
    listing_urls.each do |url|
        listing_url = PADMAPPER_BASE_URL + url
        new_info = get_padmapper_listing_info(listing_url)
        listing_infos.push(new_info)
    end
    return listing_infos
end

search_url = PADMAPPER_BASE_URL + "/apartments/boston-ma/downtown-boston"
listing_infos = get_padmapper_listing_info_from_search_url(search_url)