class Listing < ApplicationRecord
	has_many :phrase_listings
  has_many :phrases, through: :phrase_listings

  before_save :check_discriminatory_and_set_flag

  def illegal?
    flag = false
    Phrase.all.each do |phrase|
      if self.check_phrase(phrase.content)
        PhraseListing.create(listing_id: self.id, phrase_id: phrase.id)
        flag = true
      end
    end
  return flag
  end

  def check_phrase(phrase)
    regex = phrase.strip.gsub(' ','\s+')
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
  def self.date_range(start_date_str='2000-2-1', end_date_str='')
    start_date = Date.parse(start_date_str)
    end_date = Date.parse(end_date_str)
		@listings_in_range = []
		Listing.all.each do |phrase_listing|
			listed = phrase_listing.listed_at
			if listed
				if listed >= start_date && listed <= end_date
					@listings_in_range.push(phrase_listing)
				end
			end
		end
		@listings_in_range
	end

  private

  def check_discriminatory_and_set_flag
      self.discriminatory = illegal?
  end
end
