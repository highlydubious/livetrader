class Account < ActiveRecord::Base
  
  belongs_to :user
  has_many :orders
  has_many :stocks, through: :orders

  def stocks_owned
    # do some stock math in here
  end

end
