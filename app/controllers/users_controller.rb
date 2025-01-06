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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update(params.require(:user).permit(:username, :email, :password))
      redirect_to blogs_path
    else
      render "edit", status: :unprocessable_entity
    end
  end

end