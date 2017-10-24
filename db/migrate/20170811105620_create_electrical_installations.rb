class CreateElectricalInstallations < ActiveRecord::Migration[5.0]
  def change
    create_table :electrical_installations do |t|
      t.text :kennung
      t.text :leistung
      t.string :einheit

      t.timestamps
    end
    add_index :electrical_installations, :kennung, :unique => true, :name => 'electrical_installations_kennung_unique'
  end
end
