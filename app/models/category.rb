class Category < ApplicationRecord
  has_many :issues
  has_many :phrases

end