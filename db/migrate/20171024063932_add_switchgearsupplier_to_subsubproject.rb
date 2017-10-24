class AddSwitchgearsupplierToSubsubproject < ActiveRecord::Migration[5.0]
  def change
    add_reference :subsubprojects, :switchgearsupplier, index: true, null: false
    add_foreign_key :subsubprojects, :suppliers, column: :switchgearsupplier_id
  end
end
