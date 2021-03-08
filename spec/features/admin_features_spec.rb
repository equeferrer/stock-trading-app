require 'rails_helper'

RSpec.feature "AdminFeatures", type: :feature do
  before :each do
    Admin.create(name: 'new admin', email: 'admin@test.com', password: "secret", password_confirmation: "secret")
    visit new_admin_session_path
    fill_in 'admin[email]', with: 'admin@test.com'
    fill_in 'admin[password]', with: 'secret'
    click_button 'Log in'
  end

  describe "Admin dashboard" do
    it "1. should allow Admin to access Dashboard" do
      visit admins_dashboard_path
      within 'body' do
        expect(page).to have_content "Administration"
        expect(page).to have_content "Manage Users"
        expect(page).to have_content "Manage Transactions"
      end
    end
  end

  describe "Admin index" do
    it "2. should allow Admin to view all users" do
      visit admins_index_path
      within 'body' do
        expect(page).to have_content "View Users"
        expect(page).to have_content "Name"
        expect(page).to have_content "Type"
        expect(page).to have_content "Email"
      end
    end
  end

  describe 'Admin user management' do
    it "3a. should allow Admin to add a Buyer" do
      visit admins_dashboard_path
      click_link 'New User'
      expect(current_path).to eq(admins_new_user_path)
      
      expect{
        fill_in 'Name', with: 'Buyer'
        fill_in 'Email', with: 'buyer@example.com'
        fill_in 'Password', with: 'secret'
        fill_in 'Type', with: 'Buyer'
        click_button 'Create User'
      }.to change(Buyer, :count).by(1)
      
      expect(current_path).to eq(admins_index_path)
      expect(page).to have_content 'buyer@example.com'
    end

    it "3b. should allow Admin to add a Broker" do
      visit admins_dashboard_path
      click_link 'New User'
      expect(current_path).to eq(admins_new_user_path)
      
      expect{
        fill_in 'Name', with: 'Broker'
        fill_in 'Email', with: 'broker@example.com'
        fill_in 'Password', with: 'secret'
        fill_in 'Type', with: 'Broker'
        click_button 'Create User'
      }.to change(Broker, :count).by(1)

      expect(current_path).to eq(admins_index_path)
      expect(page).to have_content 'broker@example.com'
    end

    it "3c. should allow Admin to add an Admin" do
      visit admins_dashboard_path
      click_link 'New User'
      expect(current_path).to eq(admins_new_user_path)
      
      expect{
        fill_in 'Name', with: 'Admin'
        fill_in 'Email', with: 'admin@example.com'
        fill_in 'Password', with: 'secret'
        fill_in 'Type', with: 'Admin'
        click_button 'Create User'
      }.to change(Admin, :count).by(1)
      
      expect(current_path).to eq(admins_index_path)
      expect(page).to have_content 'admin@example.com'
    end
  end
  
end
