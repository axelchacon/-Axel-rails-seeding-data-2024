class AddTitleToCritics < ActiveRecord::Migration[7.0]
  def change
    add_column :critics, :title, :string
  end
end
