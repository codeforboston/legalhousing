namespace :classify_listings do
  desc 'Classify the first loaded listings as discriminatory or not'
  task initial_set: :environment do
    Listing.all.each do |listing|
      listing.update(discriminatory: true) if listing.illegal?
    end
  end

  desc 'Classify the first loaded listings as discriminatory or not'
  task recent: :environment do
    Listing.where({ created_at: (Time.now - 10.minutes)..Time.now }).each do |listing|
      listing.update(discriminatory: true) if listing.illegal?
    end
  end

  desc 'Re-classify the loaded listings as discriminatory or not'
  task reclassify: :environment do
    Listing.all.each do |listing|
      listing.update(discriminatory: true) if listing.illegal?
    end
  end

end
