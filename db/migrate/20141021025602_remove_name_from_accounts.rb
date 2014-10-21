class RemoveNameFromAccounts < ActiveRecord::Migration
  def change
    remove_column :accounts, :name
  end
end
