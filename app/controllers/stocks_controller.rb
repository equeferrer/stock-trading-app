class StocksController < ApplicationController
  before_action :authenticate_user!
  before_action :get_api

  def search
    @stock = Stock.new
  end

  def create
    @quote = @client.quote(stock_params)
    @stock = Stock.find_or_create_by(symbol: params[:symbol],
                                    name: @client.company(stock_params).company_name)
    @stock.current_price = @quote.latest_price  
    if @stock.save
      redirect_to stocks_show_path(@stock)
    else
      render :search
    end
  end
  
  def show
    @stock = Stock.find(stock_id)
  end

  def broker_add
    @stock = Stock.find(stock_id)
    @stock.users << current_user
    @stock.save
    redirect_to stocks_show_path(@stock)  
  end

  def buyer_new
    @user_stock = UserStock.find(params[:id])
    @stock = @user_stock.stock
    @broker = @user_stock.user
  end

  def buyer_create
    @user_stock = UserStock.find(params[:id])
    @stock = @user_stock.stock
    @broker = @user_stock.user
    @buyer_stock = BuyerStock.create(buyer_stock_params)
    @buyer_stock.user_id = current_user.id
    @buyer_stock.user_stock_id = @user_stock.id
      # user_stock.buyers << current_user
    if @buyer_stock.save
      @transaction = current_user.transactions.create(stock_id:@stock.id, broker_id:@broker.id, quantity:@buyer_stock.quantity,
                                                      price:@buyer_stock.price, total:(@buyer_stock.quantity * @buyer_stock.price))
      @transaction.save
      redirect_to root_path
    else
      render :buyer_new
    end

  end

  private 

  def buyer_stock_params
    params.permit(:user_id, :user_stock_id, :quantity, :price)
  end

  def get_api
    @client = IEX::Api::Client.new(
      publishable_token: ENV['PUBLISHABLE_TOKEN'],
      secret_token: ENV['SECRET_TOKEN'],
      endpoint: 'https://sandbox.iexapis.com/v1' #'https://cloud.iexapis.com/v1'
    )
  end

  def stock_params
    params[:symbol]
  end

  def stock_id
    params[:id]
  end

  def user_id
    params[:id]
  end

end
