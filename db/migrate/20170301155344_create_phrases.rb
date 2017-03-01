class CreatePhrases < ActiveRecord::Migration[5.0]
  def change
    create_table :phrases do |t|
      t.string :content
      t.string :category
      t.string :subcategory
      t.string :discriminatory_issue
      
      t.timestamps
    end
  end
end
