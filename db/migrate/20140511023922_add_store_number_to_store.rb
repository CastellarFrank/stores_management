class AddStoreNumberToStore < ActiveRecord::Migration
  def change
    add_column :stores, :store_number, :integer
  end
end
