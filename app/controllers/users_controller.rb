class UsersController < ApplicationController
  
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts
    @membership = @user.membership
  end
  
  def create
    @user = User.new(user_params)
    @membership = Membership.create(params[:membership])
    @user.membership = @membership
    if @user.save
      
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to welcome_path
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  
  
  def index
    @users = User.all
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
  end
  
  def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
  
end
