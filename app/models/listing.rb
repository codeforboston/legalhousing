class Listing < ApplicationRecord
	has_many :phrase_listings
	has_many :phrases, through: :phrase_listings

  def illegal?
    Phrase.all.each do |phrase|
      if self.description.match(/#{phrase.content}/i)
				PhraseListing.find_or_create_by(listing_id: self.id, phrase_id: phrase.id)				
				self.save
        return true
      end
    end
  return false
  end

  def check_phrase(phrase)
    regex = phrase.strip.gsub(' ','\s')
    reg_obj = Regexp.new(/#{regex}/i)
    if reg_obj.match(self.description)
      true
    else
      false
    end
  end

	def self.set_discriminatory
		Listing.all.each do |listing|
			listing.illegal?
		end
	end
	
  def self.discriminatory
    Listing.all.select {|listing| listing.discriminatory == true}
  end

	def self.num_listings
		Listing.all.count
	end
	
	def self.num_discriminatory
		Listing.discriminatory.count
	end

# default values for dates, if none are passed in
# format for date arguments: 'yyyy-mm-dd', or any portion of a date starting with 'yyyy'
	def self.date_range(start_date='2015', end_date='2020')
		@listings_in_range = []
		PhraseListing.all.each do |phrase_listing|
			listed = phrase_listing.listing.listed_at.year.to_s + '-' + phrase_listing.listing.listed_at.month.to_s + '-' + phrase_listing.listing.listed_at.day.to_s
			if listed >= start_date && listed <= end_date
				@listings_in_range.push(phrase_listing.listing)
			end
		end
		if @listings_in_range.count > 0 
			@listings_in_range
		else 
			return 'No listings found in date range specified'
		end
	end
end
