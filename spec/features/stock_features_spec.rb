require 'rails_helper'

RSpec.feature "StockFeatures", type: :feature do

  describe "Search and Add Stock" do

    it "1. should allow Buyer to search a stock" do
      Broker.create(name: 'BROKER FOR AAL', email: 'b@test.com', password: "secret", password_confirmation: "secret")
      visit new_broker_session_path
      fill_in 'broker[email]', with: 'b@test.com'
      fill_in 'broker[password]', with: 'secret'
      click_button 'Log in'
      visit stocks_search_path
      fill_in 'symbol', with: 'AAL'
      click_button 'Search'
      click_link "Add this stock to my list"
      visit root_path
      click_link 'Log out'

      Buyer.create(name: 'new buyer', email: 'buyer@test.com', password: "secret", password_confirmation: "secret")
      visit new_buyer_session_path
      fill_in 'buyer[email]', with: 'buyer@test.com'
      fill_in 'buyer[password]', with: 'secret'
      click_button 'Log in'
      visit stocks_search_path
      fill_in 'symbol', with: 'AAL'
      click_button 'Search'
      within 'body' do
        expect(page).to have_content "Stock Symbol"
        expect(page).to have_content "Current Price"
        expect(page).to have_content "List of Brokers"
        expect(page).to have_content "Buy from this broker"
        expect(page).to have_content "BROKER FOR AAL"
      end
      click_link "Buy from this broker"
      within 'body' do
        expect(page).to have_content "Stock Symbol"
        expect(page).to have_content "Current price"
        expect(page).to have_content "Broker: BROKER FOR AAL"
      end
      expect{
        fill_in 'quantity', with: 10
        click_button "Submit"
      }.to change(BuyerStock, :count).by(1)
    end

    it "2. should allow Broker to search a stock then add to list" do
      Broker.create(name: 'new broker', email: 'broker@test.com', password: "secret", password_confirmation: "secret")
      visit new_broker_session_path
      fill_in 'broker[email]', with: 'broker@test.com'
      fill_in 'broker[password]', with: 'secret'
      click_button 'Log in'

      visit stocks_search_path
      fill_in 'symbol', with: 'TSLA'
      click_button 'Search'
      within 'body' do
        expect(page).to have_content "Stock Symbol"
        expect(page).to have_content "Current Price"
        expect(page).to have_content "Add this stock to my list"
      end
      expect{
        click_link "Add this stock to my list"
      }.to change(UserStock, :count).by(1)
      within 'body' do
        expect(page).to have_content "Added stock to list"
      end
    end
  end

end
