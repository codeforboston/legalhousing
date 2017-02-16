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