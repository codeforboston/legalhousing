class TrackchangesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def get_changes
        date1_start, date1_end, date2_start, date2_end, phrase = track_changes_params

        date_range_listings_1 = get_filtered_listings(date1_start, date1_end, phrase)
        date_range_listings_2 = get_filtered_listings(date2_start, date2_end, phrase)

        changes = { 
            num_listings_1: date_range_listings_1.length,
            num_listings_2: date_range_listings_2.length
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
        # date_range_listings = Listing.date_range(date_start, date_end)
        # if date_range_listings.is_a? String
        #     # No listings found
        #     date_range_listings = []
        # else
        #     date_range_listings = date_range_listings.select {|listing| listing.check_phrase(phrase)}
        # end
        
        phrases_found = []
        for listing in Listing.all()
            if listing.check_phrase(phrase) 
                phrases_found.push(listing)
            end
        end
        return listings_found
    end
    
end
