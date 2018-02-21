require 'pry'

class ListingsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
		@listings = Listing.paginate(:page => params[:page], :per_page => 50)
		@phrases = Phrase.all
    respond_to do |format|
      format.html
      format.json {render json: @listings.to_json}
    end
  end

  def show
    set_listing
    render_listing_formats
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

	def filtered
		@listings = Listing.paginate(:page => params[:page], :per_page => 50)
    respond_to do |format|
      format.html
      format.json {render json: @listings.to_json}
    end
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
      format.html {render :template => "listings/index"}
      format.json {render json: @listings.to_json}
    end
  end

end
