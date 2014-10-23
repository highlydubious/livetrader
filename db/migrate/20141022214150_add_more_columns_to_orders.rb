class AddMoreColumnsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :qty, :integer
    add_column :orders, :action, :string
    add_column :orders, :order_type, :string
  end
end
