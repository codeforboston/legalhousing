
to file a fair housing complaint with HUD:
https://portal.hud.gov/hudportal/HUD?src=/topics/housing_discrimination

HUD fair housing advertising guide
https://hud.gov/offices/fheo/library/part109.pdf

Boston HUD office:
https://portal.hud.gov/hudportal/HUD?src=/program_offices/fair_housing_equal_opp/fheodir#Region1




Listing 
  has_many :issues
  has_many :phrases, through: :issues

Issue
  belongs_to :user
  belongs_to :phrase
  belongs_to :category

Phrase
  has_many :issues
  has_many :listings, through: :issues
  belongs_to :category

Category
  has_many :issues
  has_many :phrases