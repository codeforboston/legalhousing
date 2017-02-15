class ListingsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @listings = Listing.all
    respond_to do |format|
      format.html
      format.json {render json: @listings}
    end
  end

  def show
    set_listing
    respond_to do |format|
      format.html
      format.json {render json: @listing}
    end
  end

  def edit
    set_listing
    respond_to do |format|
      format.html
      format.json {render json: @listing}
    end
  end

  def update
    set_listing
    set_listing.update(listing_params)
    respond_to do |format|
      format.html
      format.json {render json: @listing}
    end
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.save
    respond_to do |format|
      format.html
      format.json {render json: @listing}
    end
  end

  def discriminatory
    @listings = Listing.discriminatory
    respond_to do |format|
      # do we want this to route to a separate view?
      format.html {render :index}
      format.json {render json: @listings}
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:id, :address, :listed_at, :latitude, :longitude, :description, :discriminatory, :heading)
  end

  def set_listing
    @listing = Listing.find_by(id: params[:id])
  end
end
