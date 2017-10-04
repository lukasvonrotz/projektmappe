class CreateAssemblies < ActiveRecord::Migration[5.0]
  def change
    create_table :assemblies do |t|
      t.string :kennung
      t.string :artikelnr
      t.text :bezeichnung
      t.integer :di, :default => 0, null: false
      t.integer :do, :default => 0, null: false
      t.integer :ai, :default => 0, null: false
      t.integer :ao, :default => 0, null: false
      t.integer :z, :default => 0, null: false
      t.integer :inkr, :default => 0, null: false
      t.integer :ssi, :default => 0, null: false
      t.integer :sdi, :default => 0, null: false
      t.integer :sdo, :default => 0, null: false
      t.integer :sai, :default => 0, null: false
      t.integer :sao, :default => 0, null: false
      t.float :brutto_eur, :default => 0, null: false
      t.float :brutto_chf, :default => 0, null: false
      t.float :rabatt, :default => 0, null: false

      t.timestamps
    end
  end
end
