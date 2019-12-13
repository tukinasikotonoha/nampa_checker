class Admin::UserSessionsController < Admin::BaseController
  skip_before_action :require_login, only: %i[new create destroy]
  skip_before_action :admin_user?, only: %i[new create]
  layout 'admin_user_sessions'

  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to admin_path, success: 'ログインしました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :admin_login
    end
  end

  def destroy
    logout
    redirect_to admin_login_path, success: 'ログアウトしました'
  end
end
