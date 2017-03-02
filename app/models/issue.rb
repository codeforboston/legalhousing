class Issue < ApplicationRecord
  enum status: [:open, :claimed, :processing, :resolved]
# these are enumerated by Pundit gem
# db integer corresponds to these statuses [0,1,2,3...]
# db has default of '0', upon creation of a new Issue

  belongs_to :listing
  belongs_to :phrase
  belongs_to :category
  
end
