class Vehicle < ApplicationRecord
  extend FriendlyId
  friendly_id :numberplate, use: :slugged
  extend Enumerize

  enumerize :status, :in => {
    :ok => 0,
    :warning => 1,
    :danger => 2
  }, default: :ok #, scope: true
  
  has_many :refuellings
  has_many :maintenances
  belongs_to :user
end
