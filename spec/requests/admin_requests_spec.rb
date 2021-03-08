require 'rails_helper'

RSpec.describe "Admins", type: :request do
  it "1. should show admin in home page" do
    admin = Admin.create(email: 'admin@test.com', password: "password", password_confirmation: "password")
    sign_in admin
    get admins_dashboard_path
    expect(response).to have_http_status(200)
  end

  it "2. should not show admin when not logged in" do
    get admins_dashboard_path
    expect(response).to have_http_status(302)
  end

  it "3. should deny access when not admin" do
    buyer = Buyer.create(email: 'buyer@test.com', password: "password", password_confirmation: "password")
    sign_in buyer
    get admins_dashboard_path
    expect(response).to redirect_to(root_path)
  end

end
