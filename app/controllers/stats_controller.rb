# stats controller
class StatsController < ApplicationController

  # @@cashedStats = Hash.new(0)

	def compute_stats
		@num_listings = Listing.num_listings
		@num_discriminatory = Listing.num_discriminatory
		@stats = {
			num_listings: @num_listings,
			num_discriminatory: @num_discriminatory
		}
		@stats
	end

  def index
  end

  def get_stats
    token = params[:token]

    stats = ''
    # check if token exists in hash
    # if @@cashedStats.key?(token)
      # if yes, return the value
      # stats = @@cashedStats[token]
    # else, compute the value., add it to hash, return it
    # else
      stats = compute_stats
      # @@cachedStats[token] = stats
    # end

    respond_to do |format|
      format.html
      format.json { render json: { data: stats } }
    end
  end

  def track_changes
      
  end

end
