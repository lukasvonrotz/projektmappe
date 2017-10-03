class Subsubproject < ApplicationRecord
  belongs_to :subproject

  belongs_to :wiresupplier, :class_name => 'Supplier', :foreign_key => 'wiresupplier_id'
  belongs_to :wirecaptionsupplier, :class_name => 'Supplier', :foreign_key => 'wirecaptionsupplier_id'

  has_many :grobengineerings, dependent: :destroy
end
