class AddUniquenessToOffertpositions < ActiveRecord::Migration[5.0]
  def change
    add_index :offertpositions, [:name, :subsubproject_id], :unique => true, :name => 'name_subsubproject_uniqueness'
  end
end
