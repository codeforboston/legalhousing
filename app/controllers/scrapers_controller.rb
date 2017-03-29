# started the scraper controller
#
# require 'pry'
# require_relative '..\..\lib\housing_listing_scraper\housing_listing_scraper'
#
# class ListingsController < ApplicationController
#   skip_before_filter :verify_authenticity_token
#
#   def show
#     set_scraper
#     render_scraper_formats
#   end
#
#   def scraper_params
#     params.require(:scraper).permit(:id, :address, :listed_at, :latitude, :longitude, :description, :discriminatory, :heading)
#   end
#
#   def set_scraper
#     @scraper = Listing.find_by(id: params[:id])
#   end
#
#   def render_scraper_formats
#     respond_to do |format|
#       format.html
#       format.json {render json: @scraper.to_json}
#     end
#   end
#
#   def render_scrapers_formats
#     respond_to do |format|
#       format.html
#       format.json {render json: @scrapers.to_json}
#     end
#   end
#
# end
