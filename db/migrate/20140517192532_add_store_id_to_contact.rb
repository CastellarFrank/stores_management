class AddStoreIdToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :store_id, :integer
    add_index :contacts, :store_id
  end
end
