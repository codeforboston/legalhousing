# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'


# build out the discriminatory phrases table with this seeding
csv_text = File.read(Rails.root.join('lib', 'seeds', 'bad_words.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  p = Phrase.new
  p.content = row['content']
  p.created_at = row['created_at']
  p.updated_at = row['updated_at']
  p.save
  puts "#{p.content}, saved!"
end

puts "there are now #{Phrase.count} rows in the database."

10.times do
  Listing.create(address: "i'm an address", latitude: rand(100), longitude: rand(100), description: "I'm a description", discriminatory: false, listed_at: DateTime.now, heading: "apt for rent")
end

#
5.times do
  Listing.create(address: "i'm an discriminatory address", latitude: rand(100), longitude: rand(100), description: "This is ridiculous No Black people please!", discriminatory: false, listed_at: DateTime.now, heading: "apt for rent")
end
