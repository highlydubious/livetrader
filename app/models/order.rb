class Order < ActiveRecord::Base
  belongs_to :account
  belongs_to :stock

  def new_order(stock)
      
  end

end
