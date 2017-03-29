class CreateScrapers < ActiveRecord::Migration[5.0]
  def change
    create_table :scrapers do |t|

      t.timestamps
    end
  end
end
