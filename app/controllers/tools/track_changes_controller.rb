module Tools
  class TrackChangesController < ApplicationController
    def index
      # @listings = Listing.all
      # respond_to do |format|
      #   format.html
      #   format.json {render json: @listings.to_json}
      # end
    end

    def create
  binding.pry
      # if params['start_date']
        @listings = Listing.all
      # else
        # @listings = []
      # end
      # redirect_to tools_track_changes_path
      respond_to do |format|
        format.html
        format.json {render json: @listings.to_json}
      end
    end

    private
    def stats_params
      params.require().permit()
    end

    def create_new_date_from(param_date)
      return Date.new(param_date["year"], param_date["month"], param_date["day"])
    end
  end
end