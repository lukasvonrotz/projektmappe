class AddUniquenessToIogroups < ActiveRecord::Migration[5.0]
  def change
    add_index :iogroups, [:name, :switchgearcombination_id], :unique => true, :name => 'name_switchgearcombination_uniqueness'
  end
end
