class RemoveTypeFromSeller < ActiveRecord::Migration[5.1]
  def change
    remove_column :sellers, :type, :string
  end
end
