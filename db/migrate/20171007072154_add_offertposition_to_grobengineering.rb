class AddOffertpositionToGrobengineering < ActiveRecord::Migration[5.0]
  def change
    add_reference :grobengineerings, :offertposition, index: true, foreign_key: true, null: false
  end
end
