class CreateSubprojectUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :subproject_users do |t|
      t.integer :subproject_id
      t.integer :user_id

      t.timestamps
    end
    add_index :subproject_users, [ :subproject_id, :user_id ], :unique => true, :name => 'by_subproject_and_user'
  end
end
