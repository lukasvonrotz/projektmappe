class AddSwitchgearcombinationToIogroups < ActiveRecord::Migration[5.0]
  def change
    add_reference :iogroups, :switchgearcombination, index: true, foreign_key: true
  end
end
