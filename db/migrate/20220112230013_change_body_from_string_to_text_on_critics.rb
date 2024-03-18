class ChangeBodyFromStringToTextOnCritics < ActiveRecord::Migration[7.0]
  # def up
  #   change_column :critics, :body, :text
  # end

  # def down
  #   change_column :critics, :body, :string
  # end

  def change
    reversible do |direction|
      direction.up { change_column :critics, :body, :text }
      direction.down { change_column :critics, :body, :string }
    end
  end
  
end
