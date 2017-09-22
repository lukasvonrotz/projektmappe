class AddSwitchgearToSwitchgearcombinations < ActiveRecord::Migration[5.0]
  def change
    add_reference :switchgearcombinations, :switchgear, index: true, foreign_key: true
  end
end
