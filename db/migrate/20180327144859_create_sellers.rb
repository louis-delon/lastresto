class CreateSellers < ActiveRecord::Migration[5.1]
  def change
    create_table :sellers do |t|
      t.string :name
      t.string :adress
      t.string :zip_code
      t.string :city
      t.string :type
      t.string :phone_number

      t.timestamps
    end
  end
end
