# stats controller
require "json"

class StatsController < ApplicationController
  @@cachedStats = Hash.new

  def index; end

  def get_stats
    token = params[:token]

    bNeedsCacheRefresh = true

    # Almost all of the time the token will be in the cache
    if(@@cachedStats.key?(token))
      cachedObject = @@cachedStats[token]
      lastCacheRefresh = cachedObject["timestamp"]

      # Do a check to see how may days it has been since last time
      # the cache has been refreshed
      timeInterval = ((Time.now - lastCacheRefresh) / 1.day).round

      # If it has been more than a day refresh the cache
      if(timeInterval <= 0)
        bNeedsCacheRefresh = false
      end
    end
    
    stats = ''

    if(bNeedsCacheRefresh)

      numMonths = 0

      # Convert the token into a number of months
      case token
      when '1m'
        iNumMonths = 1
      when '3m'
        iNumMonths = 3
      when '6m'
        iNumMonths = 6
      when '1y'
        iNumMonths = 12
      when '5y'
        iNumMonths = 60
      when "all"
        # We want to special case all listings because it's going to be a
        # static date and not offset from todays date
        iNumMonths = -1
      else
        puts("token " + token + " not reconised")
      end

    listings = Listing.date_range( start_date.to_s, end_date.to_s ).count
    stats = ''
      # We are always going to be computing the stats
      # based off the current date going back in time
#      end_date = Date.today


      if(iNumMonths != -1)
        start_date = end_date - iNumMonths.month
      else
        # Is is an arbatrary date
        start_date = '2010-01-01'
      end

      puts("Search from " + start_date.to_s + " to " + end_date.to_s)
    
      puts("Rebuilding cache for " + token + " at" + Time.now.to_s)

      # Create the stats from the dates we have computed
      stats = compute_stats(start_date, end_date)
      @@cachedStats[token] = { "timestamp" => Time.now, "data" => stats }
    else
      cachedObject = @@cachedStats[token]
      stats = cachedObject['data']
    end

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
