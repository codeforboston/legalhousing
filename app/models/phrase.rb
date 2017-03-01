class Phrase < ApplicationRecord

  def self.import_words
    wordsfile = File.join Rails.root, "./assets/Words.txt"
    CSV.read(wordsfile)[0].each do |phrase|
      term = phrase.gsub(", ", "")
      Phrase.find_or_create_by(content: term)
    end
  end
end
