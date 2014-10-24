class ChangeOrderPricefromIntegertoFloat < ActiveRecord::Migration
  def change
    remove_column :orders, :price
    add_column :orders, :price, :decimal
  end
end
