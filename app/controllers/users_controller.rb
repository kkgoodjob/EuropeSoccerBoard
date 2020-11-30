class UsersController < ApplicationController
  def signup
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login @user
      flash[:success] = "新規登録に成功しました"
      redirect_to @user
    else
      render "signup"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
    flash[:success] = "ログアウトしました"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
