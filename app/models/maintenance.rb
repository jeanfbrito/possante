class Maintenance < ApplicationRecord
  extend Enumerize
  belongs_to :vehicle
  has_many_attached :files
  enumerize :maintenance_type, in: [
    :preventive,
    :corretive,
    :broke
  ], default: :preventive #, scope: true+
end
