class StatsController < ApplicationController

	def compute_stats
		@num_listings = Listing.num_listings
		@num_discriminatory = Listing.num_discriminatory
		@stats = {
			num_listings: @num_listings,
			num_discriminatory: @num_discriminatory
		}
		@stats
	end
end
