class AdminsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin?

  def dashboard
  end

  def index
    @users = User.all
  end

  def pending_approval
    @users = User.where(approved: false)
  end

  def new_user
    @user = User.new
  end

  def create_user
    @user = User.new(user_params)
    if @user.save
      redirect_to admins_index_path
    else
      render :new_user
    end		
  end

  def view_user
    @user = User.find(set_user)
  end

  def edit_user
    @user = User.find(set_user)
  end

  def update_user
    @user = User.find(set_user)  
    if @user.update(user_params)
      redirect_to admins_index_path
    else 
      render :edit_user
    end
  end

  def approve_user
    user = User.find(set_user)
    user.approved = true
    if user.save
      flash[:notice] = "#{user.name} approved"
    else
      flash[:alert] = "#{user.name} approval failure"
    end
    redirect_to admins_pending_approval_path
  end

  private

  def is_admin?
    redirect_to root_path unless current_user.type == "Admin"
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :type)
  end

  def set_user
    params[:id]
  end

end
