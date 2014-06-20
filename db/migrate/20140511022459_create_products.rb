class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :unit_price
      t.decimal :wholesale
      t.decimal :size
      t.text :description

      t.timestamps
    end
  end
end
