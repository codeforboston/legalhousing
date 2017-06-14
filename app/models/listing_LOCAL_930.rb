class Listing < ApplicationRecord
  has_many :phrase_listings
  has_many :phrases, through: :phrase_listings

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
end
