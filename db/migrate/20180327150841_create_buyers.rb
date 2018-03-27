class CreateBuyers < ActiveRecord::Migration[5.1]
  def change
    create_table :buyers do |t|
      t.string :pseudo
      t.string :first_name
      t.string :last_name
      t.string :phone

      t.timestamps
    end
  end
end
