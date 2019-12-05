class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: "ユーザーを作成しました"
    else
      redirect_to root_path, danger: "ユーザーの作成に失敗しました"
    end
  end

  private

  # Strong Parameter
  def user_params
    params.require(:user).permit(
        :name
    )
  end
end
