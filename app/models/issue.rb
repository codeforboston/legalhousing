class Issue < ApplicationRecord
  belongs_to :listing
  belongs_to :phrase
  
end
