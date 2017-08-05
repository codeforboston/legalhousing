# stats controller
class StatsController < ApplicationController
  # @@cashedStats = {}

  def index; end

  def get_stats
    token = params[:token]

    token.slice! 'm' if token == '1m' || token == '3m' || token == '6m'

    token = '12' if token == '1y'

    token = '60' if token == '5y'

    end_date = Date.today
    start_date = end_date << token.to_i

    start_date = '2015-01-01' if token == 'all'

    
    stats = ''

    # check if token exists in hash
    # if @@cashedStats.key?(token)
      # if yes, return the value
      # stats = @@cashedStats[token]
    # else, compute the value., add it to hash, return it
    # else
      stats = compute_stats(start_date, end_date)
      # @@cachedStats[token] = stats
    # end

    respond_to do |format|
      format.html
      format.json { render json: { data: stats } }
    end
  end

  private

  def compute_stats(start_date_input, end_date_input)
    # Listing.date_range requires strings. Convert here if a Date object was passed in
    start_date = start_date_input.is_a?(Date) ? start_date_input.to_s : start_date_input
    end_date = end_date_input.is_a?(Date) ? end_date_input.to_s : end_date_input

    @date_filtered_listings = Listing.date_range(start_date, end_date)
    @num_listings = @date_filtered_listings.length
    @num_discriminatory = @date_filtered_listings.count{ |listing| listing.illegal? }
    
    @discriminatory_phrase_count = {}
    Phrase.all.each do |phrase|
      @num_found = @date_filtered_listings.count { |listing| listing.check_phrase(phrase.content) }
      @discriminatory_phrase_count[phrase.content] = @num_found
    end
    
    @stats = {
      num_listings: @num_listings,
      num_discriminatory: @num_discriminatory,
      discriminatory_phrase_count: @discriminatory_phrase_count
    }
    @stats
  end

end
