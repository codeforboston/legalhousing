class Listing < ApplicationRecord
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

  def self.discriminatory
    Listing.all.select {|listing| listing.discriminatory == true}
  end
end
