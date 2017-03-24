class AddReferences < ActiveRecord::Migration[5.0]
  def change
    add_reference :trips, :driver, foreign_key: true

    add_reference :trips, :passenger, foreign_key: true
  end
end
