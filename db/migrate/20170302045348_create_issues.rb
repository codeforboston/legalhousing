class CreateIssues < ActiveRecord::Migration[5.0]
  def change
    create_table :issues do |t|
      t.integer :listing_id
      t.integer :phrase_id
      t.integer :category_id
      t.string :content
      t.text :history
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
