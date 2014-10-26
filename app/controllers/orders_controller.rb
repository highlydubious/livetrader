class OrdersController < ApplicationController
  before_action :find_account

  def index
  end

  def show
  end

  def new  
    @order = @account.orders.new
    @stock = Stock.new
  end

  def create
  begin
    @order = @account.orders.new(order_params)
    @order.stock = Stock.find_or_initialize_by(name: params[:order][:stock]) # needs to be an ID
    @order.price = Stock::get_price(params[:order][:stock])[:price]
    if @order.save 
      redirect_to account_path(@account)
      # redirect_to @account
      # redirect_to @order
    else
      render 'new'
    end
  rescue
    fail
   end
  end

  def read
  end

  def update
  end

  def destroy
  end

  private
  def order_params
    params.require(:order).permit(:name, :qty)
  end

  def find_account
  
      @account = Account.find(params[:account_id])
      
  if @account && @account.user != current_user || @account == nil
      redirect_to account_path(current_user.accounts.first)
      flash[:notice] = "You cheater"
  end
  else
      # redirect_to account_path(current_user.accounts.first)
  end
  
end
