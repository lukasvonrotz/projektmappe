class AddElectricalinstallationsupplierToSubsubproject < ActiveRecord::Migration[5.0]
  def change
    add_reference :subsubprojects, :electricalinstallationsupplier, index: true, null: false
    add_foreign_key :subsubprojects, :suppliers, column: :electricalinstallationsupplier_id
  end
end
