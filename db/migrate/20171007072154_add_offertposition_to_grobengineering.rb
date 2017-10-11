class AddOffertpositionToGrobengineering < ActiveRecord::Migration[5.0]
  def change
    add_reference :grobengineerings, :offertposition, index: true, foreign_key: true
  end
end
