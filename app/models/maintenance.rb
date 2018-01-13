class Maintenance < ApplicationRecord
  belongs_to :vehicle
  has_many_attached :files
end
