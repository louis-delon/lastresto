class AddNumberOfPersonsToReservation < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :number_of_persons, :integer
  end
end
