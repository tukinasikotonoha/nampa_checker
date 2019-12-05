class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to root_path, success: "ログイン成功"
    else
      redirect_back_or_to root_path, danger: "ログイン失敗"
    end
  end

  def destroy
    logout
    redirect_to root_path, success: "ログアウトしました"
  end
end
