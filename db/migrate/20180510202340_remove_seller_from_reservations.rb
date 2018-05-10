class RemoveSellerFromReservations < ActiveRecord::Migration[5.1]
  def change
    remove_column :reservations, :seller_id, :bigint
  end
end
