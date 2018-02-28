class Listing < ApplicationRecord
	has_many :phrase_listings
  has_many :phrases, through: :phrase_listings

  before_save :check_discriminatory_and_set_flag
  after_save :add_phrase_listing_entries

  def illegal?
    return self.discriminatory
  end

	def self.get_filtered_listings(phrase)
		@filtered_listings = []
		Listing.all.each do |listing|
			if listing.check_phrase(phrase)
				@filtered_listings.push(listing)
			end
		end
		puts '------------------------------------------------------------------'
		puts "#{@filtered_listings.count} listings counted for phrase: #{phrase}"
		puts '------------------------------------------------------------------'
		@filtered_listings
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

  # Returns an array of discriminory phrases found in the listing
  def find_discriminatory_phrases
    found_phrases = []
    Phrase.all.each do |phrase|
      if self.check_phrase(phrase.content)
        found_phrases.append(phrase)
      end
    end
    return found_phrases
  end

  def check_discriminatory_and_set_flag
    found_phrases = find_discriminatory_phrases
    if found_phrases.empty?
      self.discriminatory = false
    else
      self.discriminatory = true
    end
  end

  def add_phrase_listing_entries
    if self.discriminatory
      found_phrases = find_discriminatory_phrases
      for phrase in found_phrases do
        PhraseListing.create(listing_id: self.id, phrase_id: phrase.id)
      end
    end
  end
end
