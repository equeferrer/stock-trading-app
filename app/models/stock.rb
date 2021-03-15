class Stock < ApplicationRecord
  validates :symbol, presence:true       
  validates :name, presence:true       
  validates :current_price, presence:true       

  has_many :broker_stocks
  has_many :brokers, through: :broker_stocks

end
