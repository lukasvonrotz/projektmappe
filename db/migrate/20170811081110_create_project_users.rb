class CreateProjectUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :project_users do |t|

      t.integer :project_id
      t.integer :user_id

      t.timestamps
    end
    add_index :project_users, [ :project_id, :user_id ], :unique => true, :name => 'by_category_and_post'
  end
end
