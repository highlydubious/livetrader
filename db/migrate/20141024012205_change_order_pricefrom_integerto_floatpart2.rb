class ChangeOrderPricefromIntegertoFloatpart2 < ActiveRecord::Migration
  def change
    remove_column :orders, :price
    add_column :orders, :price, :float
  end
end
