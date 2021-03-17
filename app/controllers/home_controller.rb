class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :is_buyer?, only: [:buyer_portfolio]
  before_action :is_broker?, only: [:broker_portfolio]

  def index
  
  end

  def buyer_portfolio
    @buyer_stocks = current_user.buyer_stocks
  end

  def broker_portfolio
    @stocks = current_user.stocks
  end

  private

  def is_buyer?
    redirect_to root_path unless current_user.type == "Buyer"
  end

  def is_broker?
    redirect_to root_path unless current_user.type == "Broker"
  end
end
