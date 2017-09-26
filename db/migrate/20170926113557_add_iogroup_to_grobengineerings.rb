class AddIogroupToGrobengineerings < ActiveRecord::Migration[5.0]
  def change
    add_reference :grobengineerings, :iogroup, index: true, foreign_key: true
  end
end
