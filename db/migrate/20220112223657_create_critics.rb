class CreateCritics < ActiveRecord::Migration[7.0]
  def change
    create_table :critics do |t|
      t.string :body
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
