class AddColumnToSwitchgears < ActiveRecord::Migration[5.0]
  def change
    add_column :switchgears, :typ, :integer, :default => 0, null: false
  end
end
