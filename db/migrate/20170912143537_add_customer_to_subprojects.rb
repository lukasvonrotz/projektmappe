class AddCustomerToSubprojects < ActiveRecord::Migration[5.0]
  def change
    add_reference :subprojects, :customer, index: true, foreign_key: true
  end
end
