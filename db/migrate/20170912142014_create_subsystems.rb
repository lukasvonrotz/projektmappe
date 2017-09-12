class CreateSubsystems < ActiveRecord::Migration[5.0]
  def change
    create_table :subsystems do |t|
      t.string :name

      t.timestamps
    end
  end
end
