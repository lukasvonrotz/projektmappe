class CreateIogroupcomponents < ActiveRecord::Migration[5.0]
  def change
    create_table :iogroupcomponents do |t|
      t.string :name
      t.integer :steckplatznummer, :default => 0, null: false

      t.timestamps
    end
    add_reference :iogroupcomponents, :assembly, index: true, foreign_key: true, null: false
    add_reference :iogroupcomponents, :iogroup, index: true, foreign_key: true, null: false

    add_index :iogroupcomponents, [:iogroup_id, :steckplatznummer], :unique => true, :name => 'iogroup_steckplatz_unique'
  end
end
