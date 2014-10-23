class StocksController < ApplicationController
  def get_stock

    @stock_price = Stock::stock_info(params[:symbol])
    render :json => {'symbol' => params[:symbol], 'price' => 67.54}
  end
end
