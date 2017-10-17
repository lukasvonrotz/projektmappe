class Iogroupcomponent < ApplicationRecord
  belongs_to :iogroup
  validates :iogroup, :presence => true
  belongs_to :assembly
  validates :assembly, :presence => true

  validates :steckplatznummer, uniqueness:  { scope: :iogroup_id,
                                              message: " ist bereits vergeben" }
end
