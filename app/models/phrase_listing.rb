class PhraseListing < ApplicationRecord
	belongs_to :phrase
	belongs_to :listing
	validates_uniqueness_of :phrase, scope: :listing
end
