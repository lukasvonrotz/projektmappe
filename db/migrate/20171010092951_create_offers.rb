class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
      t.datetime :datum
      t.text :beschreibung


      t.timestamps
    end
    add_reference :offers, :subsubproject, index: true, foreign_key: true, null: false
    add_reference :offers, :user, index: true, foreign_key: true, null: false
  end
end
