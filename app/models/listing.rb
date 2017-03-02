class Listing < ApplicationRecord
  has_many :listing_phrases
  has_many :phrases, through: :listing_phrases

  def self.discriminatory
    Listing.all.select {|listing| listing.discriminatory == true}
  end

  def self.check_all_listings
    @results = []
    @phrases = []
    Phrase.all.each {|p| @phrases.push(p.content)}
    Listing.all.each do |listing|
      desc = listing.description.split(" ")
      @results = (desc & @phrases)
# binding.pry
      process_listing(listing, @results)

    end
  end 

  def self.process_listing(listing, results)
    if results.length >= 1
      listing.phrases.update(results)
      listing.discriminatory = true
      listing.save
    else
      listing.discriminatory = false
      listing.save
    end
  end

end
