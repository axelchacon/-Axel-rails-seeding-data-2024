class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :name
      t.string :genre
      t.integer :price
      t.date :release_date

      t.timestamps
    end
  end
end
