class UsersController < ApplicationController
    def new
      @user = User.new
    end
  
    def create
      @user = User.create(user_params)
      return redirect_to controller: 'users', action: 'new' unless @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    end
  
    private
  
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :password, :email, :password_confirmation, :avatar)
    end
  end