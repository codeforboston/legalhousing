# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do 
  Listing.create(address: "i'm an address", latitude: 5.5, longitude: 5.5, description: "I'm a description", discriminatory: false, listed_at: DateTime.now, heading: "apt for rent")
end

5.times do 
  Listing.create(address: "i'm an address", latitude: 5.5, longitude: 5.5, description: "I'm discriminatory", discriminatory: true, listed_at: DateTime.now, heading: "apt for rent")
end

Category.create([
  { name: 'unassigned' },
  { name: 'Sexual Orientation' },
  { name: 'National Origin' },
  { name: 'Race' },
  { name: 'Mental Disability' },
  { name: 'Physical Disability' },
  { name: 'Religion' },
  { name: 'Political Affiliation' },
  { name: 'Weight or Height' },
  { name: 'Yankees Fan' },
  { name: 'Age' }
])
 
Issue.create([
  {listing_id: 11, phrase_id: 1, category_id: 1, content: "possibly biased rental ad, needs 2nd look", history: "flagged in db as discriminatory", status: 0},
  {listing_id: 12, phrase_id: 2, category_id: 2, content: "possibly biased rental ad, needs 2nd look", history: "flagged in db as discriminatory", status: 0},
  {listing_id: 13, phrase_id: 3, category_id: 3, content: "possibly biased rental ad, needs 2nd look", history: "flagged in db as discriminatory", status: 0},
  {listing_id: 14, phrase_id: 4, category_id: 4, content: "possibly biased rental ad, needs 2nd look", history: "flagged in db as discriminatory", status: 0},
  {listing_id: 15, phrase_id: 5, category_id: 5, content: "possibly biased rental ad, needs 2nd look", history: "flagged in db as discriminatory", status: 0}
  ])