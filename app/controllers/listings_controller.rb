class ListingsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @listings = Listing.all.sort
    respond_to do |format|
      format.html
      format.json {render json: @listings.to_json}
    end
  end

  def show
    set_listing
    render_formats
  end

  def edit
    set_listing
    render_formats
  end

  def update
    set_listing
    set_listing.update(listing_params)
    render_formats
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.save
    render_formats
  end

  def check_listings
    Listing.check_listings
    redirect_to discriminatory_path
  end

  def discriminatory
    @listings = Listing.where(discriminatory: true)

    #do we want this in a new view?
    respond_to do |format|
      format.html
      format.json {render json: @listing.to_json}
    render 'listings/discriminatory'
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:id, :address, :listed_at, :latitude, :longitude, :description, :discriminatory, :heading)
  end

  def set_listing
    @listing = Listing.find_by(id: params[:id])
  end

  def render_formats
    respond_to do |format|
      format.html
      format.json {render json: @listing.to_json}
    end
  end

end
