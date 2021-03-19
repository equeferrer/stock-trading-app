class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:buyer_portfolio, :broker_portfolio, :transactions]
  before_action :is_buyer?, only: [:buyer_portfolio]
  before_action :is_broker?, only: [:broker_portfolio]

  def index
  
  end

  def buyer_portfolio
    @buyer_stocks = current_user.user_stocks
  end

  def broker_portfolio
    @stocks = current_user.stocks
  end

  def transactions
    if current_user.type == "Buyer"
      @transactions = current_user.transactions
      @method = "Bought"
      @method_helper = "from"
    elsif current_user.type == "Broker"
      @transactions = Transaction.where(broker_id: current_user.id)
      @method = "Sold"
      @method_helper = "to"
    elsif  current_user.type == "Admin"
      @transactions = Transaction.all
      @method = "bought"
      @method_helper = "from"
    end
  end

  private

  def is_buyer?
    redirect_to root_path unless current_user.type == "Buyer"
  end

  def is_broker?
    redirect_to root_path unless current_user.type == "Broker"
  end
end
