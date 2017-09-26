class AddSubsystemToGrobengineerings < ActiveRecord::Migration[5.0]
  def change
    add_reference :grobengineerings, :subsystem, index: true, foreign_key: true
  end
end
