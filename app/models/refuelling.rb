class Refuelling < ApplicationRecord
  extend Enumerize

  belongs_to :vehicle
  before_create :calculaAoCriar
  before_update :calculaAoAtualizar

  enumerize :result, :in => {
    :zero => 0,
    :up => 1,
    :down => 2
  }, default: :zero #, scope: true+

  def previous
    Refuelling.previous(self.id, self.vehicle).first
  end

  private

  def calculaAoAtualizar
    lastRefill = self.previous #carrega o ultimo abastecimento

    self.liters = (self.total_value / self.liter_price).round(2)
    self.vehicle.update_attributes(:mileage => self.mileage)

    unless lastRefill.nil?
      self.traveled_mileage = self.mileage - lastRefill.mileage #calcula os quilometros rodados desde o ultimo abastecimento

      self.average_consumption = (self.traveled_mileage / self.liters).round(2)
      #binding.pry
      unless lastRefill.average_consumption.nil?
        if self.average_consumption > lastRefill.average_consumption
          self.result = :up
        elsif self.average_consumption < lastRefill.average_consumption
          self.result = :down
        else
          self.result = :zero
        end
      end
    end
  end

  def calculaAoCriar
    lastRefill = Refuelling.where(vehicle: self.vehicle).last #carrega o ultimo abastecimento

    self.liters = (self.total_value / self.liter_price).round(2)
    self.vehicle.update_attributes(:mileage => self.mileage)

    unless lastRefill.nil?
      self.traveled_mileage = self.mileage - lastRefill.mileage #calcula os quilometros rodados desde o ultimo abastecimento

      self.average_consumption = (self.traveled_mileage / self.liters).round(2)
      #binding.pry
      unless lastRefill.average_consumption.nil?
        if self.average_consumption > lastRefill.average_consumption
          self.result = :up

        elsif self.average_consumption < lastRefill.average_consumption
          self.result = :down
        else
          self.result = :zero
        end
      end
    end
  end
end
