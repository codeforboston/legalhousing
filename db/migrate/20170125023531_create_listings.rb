class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.timestamp :listed_at
      t.string :address
      t.decimal :latitude, {:precision=>10, :scale=>6}
      t.decimal :longitude, {:precision=>10, :scale=>6}
      t.string :heading
      t.string :description
      t.boolean :discriminatory

      t.timestamps
    end
  end
end
