class CreateScrapes < ActiveRecord::Migration[5.0]
  def change
    create_table :scrapes do |t|
      t.string :site
      t.integer :number_of_listings

      t.timestamps
    end
  end
end
