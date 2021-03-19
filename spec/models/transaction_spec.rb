require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it "1. should not save without quantity" do 
    transaction = Transaction.new 
    transaction.user_id = 1
    transaction.stock_id = 1
    transaction.broker_id = 2
    transaction.price = 12.34
    transaction.quantity = nil 
    transaction.total = 123.40

    expect(transaction).to_not be_valid
    expect(transaction.errors).to be_present
    expect(transaction.errors.to_hash.keys).to include(:quantity)
  end 

  it "2. should not save without price" do 
    transaction = Transaction.new 
    transaction.user_id = 1
    transaction.stock_id = 1
    transaction.broker_id = 2
    transaction.price = nil
    transaction.quantity = 10 
    transaction.total = 123.40


    expect(transaction).to_not be_valid
    expect(transaction.errors).to be_present
    expect(transaction.errors.to_hash.keys).to include(:price)
  end 

  it "3. should not save without total" do 
    transaction = Transaction.new 
    transaction.user_id = 1
    transaction.stock_id = 1
    transaction.broker_id = 2
    transaction.price = 12.34
    transaction.quantity = 10 
    transaction.total = nil


    expect(transaction).to_not be_valid
    expect(transaction.errors).to be_present
    expect(transaction.errors.to_hash.keys).to include(:total)
  end 
end
