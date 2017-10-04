class CreateSwitchgearconnections < ActiveRecord::Migration[5.0]
  def change
    create_table :switchgearconnections do |t|
      t.integer :level, :default => 0, null: false
      t.timestamps
    end

    add_reference :switchgearconnections, :topswitchgear, index: true, null: false
    add_reference :switchgearconnections, :bottomswitchgear, index: true, null: false

    add_foreign_key :switchgearconnections, :switchgearcombinations, column: :topswitchgear_id
    add_foreign_key :switchgearconnections, :switchgearcombinations, column: :bottomswitchgear_id

    add_index :switchgearconnections, [:topswitchgear_id, :bottomswitchgear_id], :unique => true,
              :name => "switchgearconnections_uniqueness"
  end
end
