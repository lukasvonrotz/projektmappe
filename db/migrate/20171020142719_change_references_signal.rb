class ChangeReferencesSignal < ActiveRecord::Migration[5.0]
  def change
    change_column :iosignals, :iochannel_id, :integer
  end
end
