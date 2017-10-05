class CreateSwitchgears < ActiveRecord::Migration[5.0]
  def change
    create_table :switchgears do |t|
      t.string :kennung
      t.text :leistung
      t.float :maxstrom, :default => 0, null: false
      t.float :brutto, :default => 0, null: false
      t.float :rabatt, :default => 0, null: false
      t.integer :typ, :default => 0, null: false

      t.timestamps
    end
  end
end
