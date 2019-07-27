class UsersController < ApplicationController
  def new
    @user = User.new(flash[:user])
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to mypage_path
    else
      flash[:notice] = 'コメントの投稿に失敗しました。'
      redirect_back fallback_location: @board
    end
  end

  def me
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
