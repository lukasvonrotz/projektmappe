class AddSubsubprojectToGrobengineerings < ActiveRecord::Migration[5.0]
  def change
    add_reference :grobengineerings, :subsubproject, index: true, foreign_key: true
  end
end
