class AddAvatarToSeller < ActiveRecord::Migration[5.1]
  def change
    add_column :sellers, :avatar, :text
  end
end
