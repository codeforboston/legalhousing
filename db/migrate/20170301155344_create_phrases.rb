class CreatePhrases < ActiveRecord::Migration[5.0]
  def change
    create_table :phrases do |t|
      t.string :content
      t.integer :category_id, default: 1
      
      t.timestamps
    end
  end
end
