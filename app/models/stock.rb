class Stock < ActiveRecord::Base
  def self.find_by_ticker(ticker_symbol)
    where(ticker: ticker_symbol).first
  end #lookup within database
  
  def self.new_from_lookup(ticker_symbol)
    looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
    return nil unless looked_up_stock.name
    
    new_stock = new(ticker: looked_up_stock.symbol, name: looked_up_stock.name)
    new_stock.last_price = new_stock.price
    new_stock
    
  end #api call for stock
  
  def price
    closing_price = StockQuote::Stock.quote(ticker).close
    if closing_price
      return "#{closing_price} (Closing)" 
    end
    
    opening_price = StockQuote::Stock.quote(ticker).open
    if opening_price
      return "#{opening_price} (Opening)" 
    end
    
    'Unavailable'
    
  end #price
  
  
end
