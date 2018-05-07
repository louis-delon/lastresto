class RenameRemoteImageUrlToImage < ActiveRecord::Migration[5.1]
  def change
      rename_column :offers, :remote_image_url, :image
  end
end
