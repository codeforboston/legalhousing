require 'csv'
class Phrase < ApplicationRecord

  def self.phrase_test
    @phrase = Phrase.find_or_create_by(content: "test phrase")
  end

  def self.import_words
    wordsfile = File.join Rails.root, "./assets/Words.txt"
    CSV.read(wordsfile)[0].each do |word|
      phrase = word.gsub(", ", "")
      phrase = Phrase.find_or_create_by(content: phrase.strip)
    end
  end

  def self.reset_phrases
    Phrase.destroy_all
		ActiveRecord::Base.connection.reset_pk_sequence!('phrases')
  end
end
