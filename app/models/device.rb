class Device < ApplicationRecord
  belongs_to :switchgear_einbau, :class_name => 'Switchgear', :foreign_key => 'switchgear_einbau_id', :optional => true

  belongs_to :wire_steuerung, :class_name => 'Wire', :foreign_key => 'wire_steuerung_id', :optional => true
  belongs_to :wire_speisung, :class_name => 'Wire', :foreign_key => 'wire_speisung_id', :optional => true
  belongs_to :wire_potausgleich, :class_name => 'Wire', :foreign_key => 'wire_potausgleich_id', :optional => true

  belongs_to :elinst_trasse, :class_name => 'ElectricalInstallation', :foreign_key => 'elinst_trasse_id', :optional => true
  belongs_to :elinst_rohr, :class_name => 'ElectricalInstallation', :foreign_key => 'elinst_rohr_id', :optional => true
  belongs_to :elinst_geraete, :class_name => 'ElectricalInstallation', :foreign_key => 'elinst_geraete_id', :optional => true

end
