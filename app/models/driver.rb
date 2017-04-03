class Driver < ApplicationRecord
  has_many :trips

  def average_rating
    return 1
  end

  def make_and_model
    "#{car_make} #{car_model}"
  end
end
