class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.new
    @books = @user.books
  end

  def edit
  end
end
