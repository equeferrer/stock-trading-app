require 'rails_helper'

RSpec.describe BuyerStock, type: :model do
  it "1. should not save without quantity" do 
    buyer_stock = BuyerStock.new 
    buyer_stock.user_id = 1
    buyer_stock.user_stock_id = 1
    buyer_stock.price = 12.34
    buyer_stock.quantity = nil 

    expect(buyer_stock).to_not be_valid
    expect(buyer_stock.errors).to be_present
    expect(buyer_stock.errors.to_hash.keys).to include(:quantity)
  end 

  it "2. should not save without price" do 
    buyer_stock = BuyerStock.new 
    buyer_stock.user_id = 1
    buyer_stock.user_stock_id = 1
    buyer_stock.price = nil
    buyer_stock.quantity = 10 

    expect(buyer_stock).to_not be_valid
    expect(buyer_stock.errors).to be_present
    expect(buyer_stock.errors.to_hash.keys).to include(:price)
  end 

end
