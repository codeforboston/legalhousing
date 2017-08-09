require "housing_listing_scraper/housing_listing_scraper"

class ScrapersController < ApplicationController

  # POST /scrapers
  # POST /scrapers.json
  def create
    listing_info, scraper_info = HousingListingScraper.run_scrapers
    listing_info.each do |scraper_listing|
      Listing.create(
        description: scraper_listing.description,
        address: scraper_listing.address,
        latitude: scraper_listing.latitude,
        longitude: scraper_listing.longitude
      )
    end

    scraper_info.each do |site_name, number_of_listings|
      scrape = Scrape.find_by(site: site_name)
      if scrape
        scrape.update(number_of_listings: scrape.number_of_listings + number_of_listings)
      else
        Scrape.create(
          site: site_name,
          number_of_listings: number_of_listings
        )
      end
    end

    redirect_to listings_path
  end

end
