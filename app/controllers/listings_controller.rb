class ListingsController < ApplicationController

  def index
    @listings = Listing.all
  end

  def show
    set_listing
  end

  def edit
    set_listing
  end

  def update
    set_listing
    set_listing.update(listing_params)
  end

  private

  def listing_params
    params.require(:listing).permit(:id, :address, :listed_at, :latitude, :longitude, :description, :discriminatory, :heading)
  end

  def set_listing
    @listing = Listing.find_by(id: params[:id])
  end
end
