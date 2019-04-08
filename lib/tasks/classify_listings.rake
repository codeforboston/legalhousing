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

  desc 'Check percentage of listings that are discriminatory'
  task check_percent: :environment do
      @count = 0
      @percent_array = Array.new(101, 0)
      Listing.all.each do |listing|
        Phrase.all.each do |phrase|
          if listing.description.match(/#{phrase.content}/i)
              puts "made it to the if statement"
              @count += 1
          end
        end
        puts "out of if statement"
        @percent_array[@count] += 1
        @count = 0
        puts "made it through one listing"
      end
      puts "#{@percent_array}"
  end

  desc 'Check Discriminatory Listing Statistics'
  task check_stats: :environment do

    stats = Phrase.joins(:listings)
                  .where('listings.listed_at >= :start_date AND listings.listed_at <= :end_date ',
                        { start_date: '2010-01-01', end_date: '2020-01-01'})
                  .group(:content).count
    puts "Toal Listings: #{Listing.all.count}"
    puts "Total Discriminatory: #{stats.values.reduce(:+)}"
    puts "Discriminatory Breakdown: #{stats}"


    # puts "Total Listings: #{Listing.all.count}"
    # puts "Discriminatory: #{Listing.where(discriminatory: true).count}"
    # breakdown = Listing.left_outer_joins(:phrases).where(listed_at: '2010-01-01'...'2020-01-01').group(:content).count
    # puts breakdown
    # puts breakdown.values.reduce(:+)
    #
    # i = 0
    # Listing.where(discriminatory: true).each do |listing|
    #   puts listing.phrases.count
    #   listing.phrases.each do |phrase|
    #     # i += 1
    #     # puts i
    #     # puts phrase.content
    #   end
    # end

  end




end
