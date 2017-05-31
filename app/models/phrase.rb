require 'csv'
class Phrase < ApplicationRecord
    has_many :phrase_listings
    has_many :listings, through: :phrase_listings
  validates :content, uniqueness: true

  def self.import_words
    csv_text = File.read(Rails.root.join('lib', 'seeds', 'bad_words.csv'))
    csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
    csv.each do |row|
      p = Phrase.new
      p.content = row['content']
      p.save
    end
  end

  def self.reset_phrases
    Phrase.destroy_all
		ActiveRecord::Base.connection.reset_pk_sequence!('phrases')
  end
end
