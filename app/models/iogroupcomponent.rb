class Iogroupcomponent < ApplicationRecord
  belongs_to :iogroup
  validates :iogroup, :presence => true
  belongs_to :assembly
  validates :assembly, :presence => true

  validates :steckplatznummer, uniqueness:  { scope: :iogroup_id,
                                              message: " ist bereits vergeben" }

  has_many :iochannels, dependent: :destroy

  def belegungs_hash
    assembly = Assembly.find(self.assembly_id)

    belegungs_hash = Hash.new
    belegungs_hash['DI'] = Hash.new
    belegungs_hash['DO'] = Hash.new
    belegungs_hash['AI'] = Hash.new
    belegungs_hash['AO'] = Hash.new
    belegungs_hash['Z'] = Hash.new
    belegungs_hash['INKR'] = Hash.new
    belegungs_hash['SSI'] = Hash.new
    belegungs_hash['SDI'] = Hash.new
    belegungs_hash['SDO'] = Hash.new
    belegungs_hash['SAI'] = Hash.new
    belegungs_hash['SAO'] = Hash.new

    index = 0

    while index < assembly.di.to_i do
      index += 1
    end
    return assembly.di
  end
end
