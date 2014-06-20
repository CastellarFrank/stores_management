class ChangesToStore < ActiveRecord::Migration
  def change
    remove_column :stores, :store_number
    rename_column :stores, :manager, :manager_name
  end
end
