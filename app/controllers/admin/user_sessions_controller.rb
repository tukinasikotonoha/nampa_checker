class Admin::UserSessionsController < AdminController
  skip_before_action :require_login, only: %i[admin_login create admin_logout]
  skip_before_action :admin_user?, only: %i[admin_login create]
  layout 'admin_user_sessions'

  def admin_login; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to admin_path, success: 'ログインしました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :admin_login
    end
  end

  def admin_logout
    logout
    redirect_to admin_login_path, success: 'ログアウトしました'
  end
end
