class RemoveForeignKeySellerToReservations < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :reservations, column: :seller_id
  end
end
