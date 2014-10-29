class AccountsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
    @accounts = Account.all
  end

  def show
    @account = Account.find(params[:id])
    @orders = @account.orders
  end


end
