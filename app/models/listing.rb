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
      process_listing(listing, @results)

    end
  end 

  def self.process_listing(listing, results)
    if results.length >= 1
      listing.discriminatory = true
      add_results_to_listing(listing, results)
      listing.save
    else
      listing.discriminatory = false
      listing.save
    end
  end

  def self.add_results_to_listing(listing, results)
    results.each do |result|
    phrase = Phrase.find_or_create_by(content: result)
      ListingPhrase.create(listing_id: listing.id, phrase_id: phrase.id )
    end
  end

end
