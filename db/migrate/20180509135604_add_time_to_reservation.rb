class AddTimeToReservation < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :time, :time
  end
end
