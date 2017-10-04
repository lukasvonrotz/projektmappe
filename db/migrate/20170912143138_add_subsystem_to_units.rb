class AddSubsystemToUnits < ActiveRecord::Migration[5.0]
  def change
    add_reference :units, :subsystem, index: true, foreign_key: true, null: false
  end
end
