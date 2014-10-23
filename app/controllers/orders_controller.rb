class OrdersController < ApplicationController
  before_action :create_account

  def index
  end

  def show
  end

  def new  
    @order = @account.orders.new
  end

  def create
    # autopopulate stock info
    # @order = @stock.orders.new()
    # need dropdown or autopopulated account
    @order = @stock.orders.new(order_params)
    @order.account = 
    @order.price = Stock::stock_info(params[:price])
  end

  def read
  end

  def update
  end

  def destroy
  end

  private
  def order_params
    # params.require(:order).permit()
  end

  def create_account
    @account = Account.find(params[:account_id])
  end
end
