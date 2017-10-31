require 'pry'

class ListingsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def get_map_points
    map_points = [{lat:42.3601, long:-71.0589}]

    @listings = Listing.all

    @listings.each do |point|
      array = []

      if point.latitude.to_f > 41.6821 &&
        point.latitude.to_f < 42.9337 &&
        point.longitude.to_f < -69.9598 &&
        point.longitude.to_f > -72.2781

        array << point.address
        array << point.latitude
        array << point.longitude
      end

      map_points << array
    end

    respond_to do |format|
      format.html
      format.json { render json: { data: map_points } }
    end
  end

  def index
    @listings = Listing.paginate(:page => params[:page], :per_page => 50)
    respond_to do |format|
      format.html
      format.json {render json: @listings.to_json}
    end
  end

  def show
    @listings = Listing.paginate(:page => params[:page], :per_page => 50)
    respond_to do |format|
      format.html
      format.json {render json: @listings.to_json}
    end
  end

  def edit
    set_listing
    render_listing_formats
  end

  def update
    set_listing
    set_listing.update(listing_params)
    render_listing_formats
  end

  def visualization
      puts "show"
    @listings = Listing.all
    render_listings_formats
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.save
    render_listing_formats
  end

  def discriminatory
    @listings = Listing.discriminatory
    render_listings_formats
  end

  def home
  end

  private

  def listing_params
    params.require(:listing).permit(:id, :address, :listed_at, :latitude, :longitude, :description, :discriminatory, :heading)
  end

  def set_listing
    @listing = Listing.find_by(id: params[:id])
  end

  def render_listing_formats
    respond_to do |format|
      format.html
      format.json {render json: @listing.to_json}
    end
  end

  def render_listings_formats
    respond_to do |format|
      format.html
      format.json {render json: @listings.to_json}
    end
  end
end
