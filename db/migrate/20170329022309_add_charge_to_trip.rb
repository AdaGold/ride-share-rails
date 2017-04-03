class AddChargeToTrip < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :price, :float
  end
end
