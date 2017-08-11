class CreateElectricalInstallations < ActiveRecord::Migration[5.0]
  def change
    create_table :electrical_installations do |t|
      t.text :kennung
      t.text :leistung
      t.string :einheit
      t.float :brutto
      t.float :rabatt

      t.timestamps
    end
  end
end
