class Listing < ApplicationRecord
<<<<<<< HEAD
  def illegal?
    case self.description
      when /no\s*section\s*(8|eight)/i
        true
      when /professionals\s*only/i
        true
      when /no\s*students/i
        true
      when /no\s*couples/i
        true
      else
        return false
    end
  end
=======
  has_many :listing_phrases
  has_many :phrases, through: :listing_phrases
>>>>>>> 6d07bfc4a79506ee553e1390f5a07274b125622f

  def self.discriminatory
    Listing.all.select {|listing| listing.discriminatory == true}
  end

<<<<<<< HEAD
  def self.search(search)
    where("description ILIKE ? OR heading ILIKE ? OR address ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end
=======
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
    issue = Issue.new(listing_id: listing.id, phrase_id: phrase.id)
    issue.save
    end
  end

>>>>>>> 6d07bfc4a79506ee553e1390f5a07274b125622f
end
