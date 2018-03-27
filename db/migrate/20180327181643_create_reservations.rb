class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.date :date
      t.references :offer, foreign_key: true
      t.references :seller, foreign_key: true
      t.references :buyer, foreign_key: true

      t.timestamps
    end
  end
end
