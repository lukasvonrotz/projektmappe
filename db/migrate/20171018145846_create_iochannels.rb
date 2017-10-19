class CreateIochannels < ActiveRecord::Migration[5.0]
  def change
    create_table :iochannels do |t|
      t.integer :kanalnummer, :default => 0, null: false
      t.string :channeltype
      t.string :address_suffix

      t.timestamps
    end

    add_reference :iochannels, :iogroupcomponent, index: true, foreign_key: true, null: false
    add_index :iochannels, [:kanalnummer, :channeltype, :iogroupcomponent_id],
              :unique => true,
              :name => 'kanalnummer_typ_iogroupcomponent_uniqueness'
  end
end
