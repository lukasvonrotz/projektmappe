class AddIotypeToIogroups < ActiveRecord::Migration[5.0]
  def change
    add_reference :iogroups, :iotype, index: true, foreign_key: true
  end
end
