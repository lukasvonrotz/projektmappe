class CreateSwitchgearcombinations < ActiveRecord::Migration[5.0]
  def change
    create_table :switchgearcombinations do |t|
      t.string :name
      t.string :standort
      t.float :u_feed_power, :default => 0, null: false
      t.float :u_feed_control, :default => 0, null: false
      t.float :u_out_power, :default => 0, null: false
      t.float :u_out_control_high, :default => 0, null: false
      t.float :u_out_control_low, :default => 0, null: false

      t.timestamps
    end
    add_reference :switchgearcombinations, :switchgear, index: true, foreign_key: true, null: false
  end
end
