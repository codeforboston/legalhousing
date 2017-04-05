require "housing_listing_scraper/housing_listing_scraper"

class ScrapersController < ApplicationController

  # POST /scrapers
  # POST /scrapers.json
  def create
    HousingListingScraper.run_scrapers().each do |scraper_listing|
      Listing.create(
      description: scraper_listing.description,
      address: scraper_listing.address,
      latitude: scraper_listing.latitude,
      longitude: scraper_listing.longitude,
      )
    end
    redirect_to listings_path
  end

end
