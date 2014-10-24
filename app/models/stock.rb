class Stock < ActiveRecord::Base
require 'yql-query'
require 'HTTParty'

  has_many :orders
  has_many :accounts, through: :orders


  def self.get_price(symbol)
    t = Time.now.strftime "%Y-%m-%d"
    startDate = '2014-10-21'
    endDate = '2014-10-21'

    builder = YqlQuery::Builder.new

    builder.table('yahoo.finance.historicaldata')
    builder.select('*')
    builder.where(["symbol = '#{symbol}' ", "startDate = '#{startDate}' ", "endDate = '#{endDate}' "])

    query = URI.escape(builder.to_query)

    url = "https://query.yahooapis.com/v1/public/yql?q=#{query}&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback="

    response = HTTParty.get(url)


    symbol = response["query"]["results"]["quote"]["Symbol"]
    close = response["query"]["results"]["quote"]["Close"]

    stock = {
      symbol: symbol, 
      price: close
    }

    puts url

  end

  def current_price(symbol)

  end

end
