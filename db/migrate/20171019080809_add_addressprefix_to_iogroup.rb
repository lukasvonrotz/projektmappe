class AddAddressprefixToIogroup < ActiveRecord::Migration[5.0]
  def change
    add_column :iogroups, :address_prefix, :string
  end
end
