class TrackchangesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def get_changes
        date1_start, date1_end, date2_start, date2_end, phrase = track_changes_params
        date_range_listings_1 = get_filtered_listings(date1_start, date1_end, phrase)
        date_range_listings_2 = get_filtered_listings(date2_start, date2_end, phrase)

        changes = { 
            num_listings_1: date_range_listings_1[0],
            num_listings_1_discrim: date_range_listings_1[1],
            num_listings_2: date_range_listings_2[0],
            num_listings_2_discrim: date_range_listings_2[1]
        }
        
        respond_to do |format|
            format.html
            format.json { render json: { data: changes } }
        end
    end

private

    def track_changes_params
        params.require([:d1_start, :d1_end, :d2_start, :d2_end, :phrase])
    end

    def get_filtered_listings(date_start, date_end, phrase)
        date_range_listings = Listing.date_range(date_start, date_end)
        phrases_found = []
        for listing in date_range_listings
            if listing.check_phrase(phrase) 
                phrases_found.push(listing)
            end
        end
        return [date_range_listings.count, phrases_found.length]
    end

    def trackform
        @phrases = Phrase.all
    end
    
    
end
