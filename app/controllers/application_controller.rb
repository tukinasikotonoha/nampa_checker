class ApplicationController < ActionController::Base
  # ログイン済みユーザーかどうか確認
  before_action :require_login

  private
  def not_authenticated
    redirect_to login_path, alert: "ログインしてください"
  end
end
