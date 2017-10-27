class AddKundennummerToCustomer < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :kundennummer_neu, :string
    add_column :customers, :kundennummer_alt, :string
  end
end
