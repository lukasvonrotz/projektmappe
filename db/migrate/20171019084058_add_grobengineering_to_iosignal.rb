class AddGrobengineeringToIosignal < ActiveRecord::Migration[5.0]
  def change
    add_reference :iosignals, :grobengineerings, index: true, foreign_key: true, null: false
  end
end
