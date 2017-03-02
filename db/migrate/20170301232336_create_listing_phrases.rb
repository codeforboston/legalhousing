class CreateListingPhrases < ActiveRecord::Migration[5.0]
  def change
    create_table :listing_phrases do |t|
      t.integer :listing_id
      t.integer :phrase_id

      t.timestamps
    end
  end
end
