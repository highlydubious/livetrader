class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :stock
      t.integer :price

      t.timestamps
    end
  end
end
