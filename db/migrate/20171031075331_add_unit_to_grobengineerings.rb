class AddUnitToGrobengineerings < ActiveRecord::Migration[5.0]
  def change
    add_reference :grobengineerings, :unit, index: true, foreign_key: true
  end
end
