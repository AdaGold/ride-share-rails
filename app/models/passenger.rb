class Passenger < ApplicationRecord
  has_many :trips
  validates :name, presence: true
  validates :phone_num, presence: true, uniqueness: true

  def total_charges
    valid_trips = self.trips.where.not(cost: nil)
    total_charges = valid_trips.map {|trip| trip.cost}
    return total_charges.sum.round(2)
  end
end
