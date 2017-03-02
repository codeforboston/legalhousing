class Phrase < ApplicationRecord
  has_many :listing_phrases
  has_many :listings, through: :listing_phrases

  def self.import_phrases
    wordsfile = File.join Rails.root, "./assets/Words.txt"
    CSV.read(wordsfile)[0].each do |phrase|
      term = phrase.gsub(", ", "")
      phrase = Phrase.find_or_create_by(content: term.strip)
    end
    self.scrub_phrases
  end

  def self.scrub_phrases
    Phrase.all.each do |phrase|
      phrase.content.strip
      phrase.save
    end
  end

  def self.delete_phrases
    Phrase.all.each {|p|p.delete}
  end
end
