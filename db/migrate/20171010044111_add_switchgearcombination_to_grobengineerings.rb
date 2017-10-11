class AddSwitchgearcombinationToGrobengineerings < ActiveRecord::Migration[5.0]
  def change
    add_reference :grobengineerings, :schaltschrank_preisberechnung, index: true
    add_foreign_key :grobengineerings, :switchgearcombinations, column: :schaltschrank_preisberechnung_id
  end
end
