class RelateTripstoDrivers < ActiveRecord::Migration[6.0]
  def change
    add_reference :trips, :driver, index: true
  end
end
