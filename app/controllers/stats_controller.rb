# stats controller
class StatsController < ApplicationController
  # @@cashedStats = {}

  def compute_stats
    @num_listings = Listing.num_listings
    @num_discriminatory = Listing.num_discriminatory
    @stats = {
      num_listings: @num_listings,
      num_discriminatory: @num_discriminatory
    }
    @stats
  end

  def index; end

  def get_stats
    token = params[:token]

    token.slice! 'm' if token == '1m' || token == '3m' || token == '6m'

    token = '12' if token == '1y'

    token = '60' if token == '5y'

    end_date = Date.today
    start_date = end_date << token.to_i

    start_date = '2015-01-01' if token == 'all'

    listings = Listing.date_range( start_date.to_s, end_date.to_s ).count
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
    @phrases = Phrase.all
  end


end
