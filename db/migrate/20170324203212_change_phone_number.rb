class ChangePhoneNumber < ActiveRecord::Migration[5.0]
  def change
    rename_column :passengers, :phone_num, :phone_number
  end
end
