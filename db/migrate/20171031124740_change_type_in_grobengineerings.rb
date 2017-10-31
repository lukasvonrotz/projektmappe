class ChangeTypeInGrobengineerings < ActiveRecord::Migration[5.0]
  def change
    change_column :grobengineerings, :hwdevice_typenr_int, :string
  end
end
