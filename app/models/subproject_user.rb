class SubprojectUser < ApplicationRecord
  belongs_to :user
  belongs_to :subproject
end
