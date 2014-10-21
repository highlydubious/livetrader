class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.integer :balance
      t.string :stock

      t.timestamps
    end
  end
end
