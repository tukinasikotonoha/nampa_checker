class Test::SessionsController < ActionController::Base
  def login_as
    user = User.find(params[:user_id])
    auto_login(user)
    redirect_to root_path, success: "#{user.name}でログインしました!"
  end
end
