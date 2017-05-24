class Listing < ApplicationRecord
  def illegal?
      Phrase.all.each do |phrase|
          if self.description.match(/#{phrase.content}/i)
              true
          end
      end
      false
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

  def self.discriminatory
    Listing.all.select {|listing| listing.discriminatory == true}
  end
end
