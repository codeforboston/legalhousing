class CreatePhraseListing < ActiveRecord::Migration[5.0]
  def change
    create_table :phrase_listings do |t|
      t.integer :phrase_id
      t.integer :listing_id
    end
  end
end
