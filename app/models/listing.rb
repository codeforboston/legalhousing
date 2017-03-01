class Listing < ApplicationRecord
   
  def self.check_listings
    @terms = []
    @suspects = {}
    @description_array = []
    @phrases = Phrase.import_words

    Listing.all.each do |listing|
      @description_array = listing.description.split(" ")
      
      if (@phrases & @description_array).any?

      @suspects[listing.id]= (@phrases & @description_array)
      listing.update(discriminatory: true)
      end
    end
    @suspects
  end

  def self.discriminatory
    self.check_all_listings
    Listing.all.select {|listing| listing.discriminatory == true}
  end

end
