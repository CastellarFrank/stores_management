class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.text :address
      t.string :manager
      t.integer :telephone

      t.timestamps
    end
  end
end
