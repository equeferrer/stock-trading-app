class BuyerStock < ApplicationRecord
  validates :quantity, presence:true       
  validates :price, presence:true    

  belongs_to :user
  belongs_to :user_stock
end
