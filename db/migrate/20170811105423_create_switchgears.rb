class CreateSwitchgears < ActiveRecord::Migration[5.0]
  def change
    create_table :switchgears do |t|
      t.string :kennung
      t.text :leistung
      t.float :maxstrom
      t.float :brutto
      t.float :rabatt, :default => 0

      t.timestamps
    end
  end
end
