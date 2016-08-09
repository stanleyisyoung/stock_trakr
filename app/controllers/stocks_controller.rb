class StocksController < ApplicationController
  def search
    
    if params[:stock]
      @stock = Stock.find_by_ticker(params[:stock])
      @stock ||= Stock.new_from_lookup(params[:stock])
    end #if stock valid check database, else new call
    
    if @stock
      # render json: @stock
      render partial: 'lookup'
    else
      render status: :not_found, nothing: true
    end #if else
    
  end #search
  
end #StocksController