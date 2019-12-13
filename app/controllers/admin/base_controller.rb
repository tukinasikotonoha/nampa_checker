class Admin::BaseController < ApplicationController
  before_action :admin_user?
  layout 'admin_dashboards'

  def admin_user?
    redirect_back_or_to root_path, warning: '権限がありません' unless current_user.admin?
  end

  private

  def not_authenticated
    flash[:warning] = 'ログインしてください'
    redirect_to admin_login_path
  end
end
