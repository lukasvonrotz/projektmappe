class Iosignalibninfo < ApplicationRecord
  belongs_to :iosignal
  validates :iosignal, :presence => true
end
