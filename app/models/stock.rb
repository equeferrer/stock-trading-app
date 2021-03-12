class Stock < ApplicationRecord
  validates :symbol, presence:true       
  validates :name, presence:true       
  validates :current_price, presence:true       

end
