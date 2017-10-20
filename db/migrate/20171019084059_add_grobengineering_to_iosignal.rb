class AddGrobengineeringToIosignal < ActiveRecord::Migration[5.0]
  def change
    add_reference :iosignals, :grobengineering, index: true, foreign_key: true, null: false
  end
end
