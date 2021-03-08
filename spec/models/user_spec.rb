require 'rails_helper'

RSpec.describe User, type: :model do
  it "1. should not save without name" do 
    user = User.new 
    user.email = "jerickcamacho42@gmail.com"
    user.name = nil 

    expect(user).to_not be_valid
    expect(user.errors).to be_present
    expect(user.errors.to_hash.keys).to include(:name)
  end 
end
