class ListingsController < ApplicationController
  before_action :set_listing, only:[:show, :edit, :update]
  skip_before_filter :verify_authenticity_token

  def index
<<<<<<< HEAD
    if params[:search]
      @listings = Listing.search(params[:search]).order("created_at DESC").paginate(:page => params[:page], :per_page => 50)
      @search_term = params[:search]
    else
      @listings = Listing.paginate(:page => params[:page], :per_page => 50)
    end
=======
    @listings = Listing.all.sort
>>>>>>> 6d07bfc4a79506ee553e1390f5a07274b125622f
    respond_to do |format|
      format.html
      format.json {render json: @listings.to_json}
    end
  end

  def show
    render_formats
  end

  def edit
    render_formats
  end

  def update
    @listing.update(listing_params)
    if @listing.save
      flash[:message] = "Listing updated"
      redirect_to listing_path
      render_formats
    else
      render :edit 
    end
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.save
    render_formats
    redirect_to listings_path
  end

  def check_all_listings
    Listing.check_all_listings
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
    @listing = Listing.find_by_id(params[:id])
  end

  def render_formats
    respond_to do |format|
      format.html
      format.json {render json: @listing.to_json}
    end
  end

end
