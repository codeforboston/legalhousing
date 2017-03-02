class Category < ApplicationRecord
  has_many :issues
  has_many :phrases

  validates :name, presence: true, uniqueness: true

end