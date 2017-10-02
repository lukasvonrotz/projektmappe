class CreateAssemblies < ActiveRecord::Migration[5.0]
  def change
    create_table :assemblies do |t|
      t.string :kennung
      t.string :artikelnr
      t.text :bezeichnung
      t.integer :di, :default => 0
      t.integer :do, :default => 0
      t.integer :ai, :default => 0
      t.integer :ao, :default => 0
      t.integer :z, :default => 0
      t.integer :inkr, :default => 0
      t.integer :ssi, :default => 0
      t.integer :sdi, :default => 0
      t.integer :sdo, :default => 0
      t.integer :sai, :default => 0
      t.integer :sao, :default => 0
      t.float :brutto_eur
      t.float :brutto_chf
      t.float :rabatt

      t.timestamps
    end
  end
end
