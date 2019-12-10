Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tops#index'
  resources :results, param: :uuid, only: %i[index show new create destroy]
  get '/mypage', to: 'users#show' # マイページ
  delete '/logout', to: 'user_sessions#destroy' # ログアウト機能
  post 'oauth/callback', to: 'oauths#callback' # Twitterログイン
  get 'oauth/callback', to: 'oauths#callback' # for use with Github, Facebook
  get 'oauth/:provider', to: 'oauths#oauth', as: :auth_at_provider
  # テスト環境でTwitterログイン認証を通すためのルーティング
  if Rails.env.test?
    get '/login_as/:user_id', to: 'test/sessions#login_as'
  end
end
