class UsersController < ApplicationController
# before_action :is_matching_login_user, only: [:edit, :update]

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def index
    @users = User.all
    @book = Book.new
    @book_new = Book.new
  end



  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book_new = Book.new
  end

  def edit
    # is_matching_login_user
    @user = User.find(params[:id])

  if @user == current_user
            render "edit"
          else
            redirect_to user_path(current_user)
          end
  end

  def update
    # is_matching_login_user

    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
    else
    render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

  # def is_matching_login_user
  #   user_id = params[:id].to_i
  #   unless user_id == current_user.id
  #     redirect_to user_path(current_user)
  #   end
  # end
s

end
