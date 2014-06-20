class AddStoreIdToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :store_id, :integer
  end
end
