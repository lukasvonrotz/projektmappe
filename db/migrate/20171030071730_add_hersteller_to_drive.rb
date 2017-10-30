class AddHerstellerToDrive < ActiveRecord::Migration[5.0]
  def change
    add_column :drives, :hersteller, :string
  end
end
