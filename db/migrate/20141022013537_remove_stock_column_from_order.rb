class RemoveStockColumnFromOrder < ActiveRecord::Migration
  def change
    remove_column :orders, :stock
  end
end
