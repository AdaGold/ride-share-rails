class Driver < ApplicationRecord
  has_many :trips
  validates :name, presence: true
  validates :vin, presence: true, length: {is: 17}, uniqueness: true
  

  def avg_rating
    valid_trips = self.trips.where.not(rating: nil)
    total_ratings = valid_trips.map {|trip| trip.rating}
    return "No Ratings" if total_ratings.empty?

    avg_rating = total_ratings.sum.to_f  / valid_trips.count
    return avg_rating.round(1)
  end

  def total_earnings
    valid_trips = self.trips.where.not(cost: nil)
    total_fees = valid_trips.count * 1.65
    grand_total = valid_trips.map {|trip| trip.cost}
    total_earnings = (grand_total.sum - total_fees) * 0.8
    return total_earnings.round(2)
  end
end
