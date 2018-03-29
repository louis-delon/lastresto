class AddAvatarToBuyer < ActiveRecord::Migration[5.1]
  def change
    add_column :buyers, :avatar, :text
  end
end
