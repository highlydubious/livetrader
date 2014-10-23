class AddStockIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :stock_id, :integer
  end
end
