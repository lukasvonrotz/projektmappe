class CreateElectricalInstallations < ActiveRecord::Migration[5.0]
  def change
    create_table :electrical_installations do |t|
      t.text :kennung
      t.text :leistung
      t.string :einheit
      t.float :brutto, :default => 0, null: false
      t.float :rabatt, :default => 0, null: false

      t.timestamps
    end
  end
end
