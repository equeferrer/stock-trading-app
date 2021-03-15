class Broker < User
  has_many :broker_stocks
  has_many :stocks, through: :broker_stocks
  
end

