class CreateSwitchgearcombinations < ActiveRecord::Migration[5.0]
  def change
    create_table :switchgearcombinations do |t|
      t.string :name
      t.string :standort
      t.float :u_feed_power
      t.float :u_feed_control
      t.float :u_out_power
      t.float :u_out_control_high
      t.float :u_out_control_low

      t.timestamps
    end
  end
end
