class Buyer < User
  has_many :buyer_stocks, foreign_key: :user_id
  has_many :user_stocks, through: :buyer_stocks

  has_many :transactions, foreign_key: :user_id
end
