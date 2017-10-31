class AddTypenrToGrobengineerings < ActiveRecord::Migration[5.0]
  def change
    add_column :grobengineerings, :hwdevice_typenr_int, :integer, :default => 0, null: false
  end
end
