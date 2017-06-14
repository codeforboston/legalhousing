class Listing < ApplicationRecord
<<<<<<< HEAD
  has_many :phrase_listings
  has_many :phrases, through: :phrase_listings
=======
	has_many :phrase_listings
	has_many :phrases, through: :phrase_listings
>>>>>>> 040928f95babc6900dcf2582ecb5cbeb542933f1

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

  def self.discriminatory
    Listing.all.select {|listing| listing.discriminatory == true}
  end

	def self.num_listings
		Listing.all.count
	end
	
	def self.num_discriminatory
		Listing.discriminatory.count
	end
end
