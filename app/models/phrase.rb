class Phrase < ApplicationRecord
  has_many :listing_phrases
  has_many :listings, through: :listing_phrases
  belongs_to :category

  validates :content, presence: true, uniqueness: true

  def self.import_phrases
    wordsfile = File.join Rails.root, "./assets/Words.txt"
    CSV.read(wordsfile)[0].each do |phrase|
      term = phrase.gsub(", ", "")
      phrase = Phrase.find_or_create_by(content: term.strip)
    end
  end

  def self.delete_phrases
    # Phrase.all.each {|p|p.delete}
    sql =  <<-SQL 
      TRUNCATE TABLE phrases ('RESTART IDENTITY CASCADE') 
        SQL
  end
end
