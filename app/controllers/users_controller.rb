class UsersController < ApplicationController
   
  def new
    @user = User.new()
  end

  def create
    
    @user = User.new(params.require(:user).permit(:username, :email, :password))

    if @user.save 
      session[:user_id] = @user.id
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
      redirect_to @user
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
    @blogs = @user.blogs
  end

  def index
    @users = User.all()
  end

  def destroy
    @user = User.find(params[:id])
    session[:user_id] = nil
    @user.destroy
    redirect_to root_path
  end
end