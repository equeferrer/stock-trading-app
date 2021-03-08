class AdminsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin?

  def dashboard
  end

  def index
  end

  def new_user
  end

  def create_user
  end

  private

  def is_admin?
    redirect_to root_path unless current_user.type == "Admin"
  end
  
end
