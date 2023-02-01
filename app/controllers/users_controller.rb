class UsersController < ApplicationController
  
  
  
  def index
    @users = User.all
  end

  def show
    @user = User.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    
  end
end
