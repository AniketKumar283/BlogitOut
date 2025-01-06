class UsersController < ApplicationController
   
  def new
    @user = User.new()
  end

  def create
    
    @user = User.new(params.require(:user).permit(:username, :email, :password))

    if @user.save 
      redirect_to blogs_path
    else
      render "new", status: :unprocessable_entity
    end
    
  end

end