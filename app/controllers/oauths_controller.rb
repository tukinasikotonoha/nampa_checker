class OauthsController < ApplicationController
  skip_before_action :require_login

  # sends the user on a trip to the provider,
  # and after authorizing there back to the callback url.
  def oauth
    login_at(params[:provider])
  end

  def callback
    # Twitter認証をキャンセルした場合401が返ってくるのでリダイレクトさせる
    redirect_to root_path and return if params[:denied].present?
    provider = "twitter"
    @user = login_from(provider)
    if @user
      redirect_to root_path, :notice => "#{provider.titleize}でログインしました!"
    else
      begin
        @user = create_from(provider)
        # NOTE: this is the place to add '@user.activate!' if you are using user_activation submodule
        reset_session # protect from session fixation attack
        auto_login(@user)
        redirect_to root_path, :notice => "#{provider.titleize}でログインしました!"
      rescue
        redirect_to root_path, :alert => "#{provider.titleize}のログインに失敗しました!"
      end
    end
  end
end
