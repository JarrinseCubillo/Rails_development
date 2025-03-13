class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]
  before_action :set_user, only: %i[show edit destroy]
  
  def index
    @users = User.all
  end

  def show; end

  def new 
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params) 
    
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Sign Up Sucessfully"
    else
      render :new, status: :unprocessable_entity
    end
      
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "User was updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    session[:user_id] = nil if current_user == @user
    @user.destroy
    redirect_to users_path, notice: "User sucessfully deleted"
  end
  
  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
