class AddDeviceToGrobengineerings < ActiveRecord::Migration[5.0]
  def change
    add_reference :grobengineerings, :device, index: true, foreign_key: true, null: false
  end
end
