class OauthsController < ApplicationController
  skip_before_action :require_login

  # sends the user on a trip to the provider,
  # and after authorizing there back to the callback url.
  def oauth
    login_at(params[:provider])
  end

  def callback
    provider = 'twitter'
    # Twitter認証をキャンセルした場合401が返ってくるのでリダイレクトさせる
    redirect_to(root_path, warning: "#{provider}のログインに失敗しました") && return if params[:denied].present?
    @user = login_from(provider)
    if @user
      redirect_to root_path, success: "#{provider}でログインしました!"
    else
      begin
        @user = create_from(provider)
        # NOTE: this is the place to add '@user.activate!' if you are using user_activation submodule
        reset_session # protect from session fixation attack
        auto_login(@user)
        redirect_to root_path, success: "#{provider}でログインしました!"
      rescue StandardError
        redirect_to root_path, warning: "#{provider}のログインに失敗しました"
      end
    end
  end
end
