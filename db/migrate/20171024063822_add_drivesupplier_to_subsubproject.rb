class AddDrivesupplierToSubsubproject < ActiveRecord::Migration[5.0]
  def change
    add_reference :subsubprojects, :drivesupplier, index: true, null: false
    add_foreign_key :subsubprojects, :suppliers, column: :drivesupplier_id
  end
end
