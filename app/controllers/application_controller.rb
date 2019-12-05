class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  # ログイン済みユーザーかどうか確認
  before_action :require_login

  private

  def not_authenticated
    redirect_to root_path, warning: 'ログインしてください'
  end
end
