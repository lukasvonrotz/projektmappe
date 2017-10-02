class Grobengineering < ApplicationRecord
  belongs_to :subsubproject

  belongs_to :subsystem, optional: true
  belongs_to :iogroup, optional: true
  belongs_to :drive, optional: true
  belongs_to :device

  belongs_to :switchgear_motorenabgang, :class_name => 'Switchgear', :foreign_key => 'switchgear_motorenabgang_id', :optional => true
  belongs_to :fu_typ, :class_name => 'Drive', :foreign_key => 'fu_typ_id', :optional => true
  belongs_to :wire_spez1, :class_name => 'Wire', :foreign_key => 'wire_spez1_id', :optional => true
  belongs_to :wire_spez2, :class_name => 'Wire', :foreign_key => 'wire_spez2_id', :optional => true
  belongs_to :wire_spez3, :class_name => 'Wire', :foreign_key => 'wire_spez3_id', :optional => true

end
