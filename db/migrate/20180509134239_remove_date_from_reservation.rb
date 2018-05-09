class RemoveDateFromReservation < ActiveRecord::Migration[5.1]
  def change
    remove_column :reservations, :date, :date
  end
end
