class Transaction < ApplicationRecord
  validates :quantity, presence:true       
  validates :price, presence:true    
  validates :total, presence:true   

  belongs_to :user
end
