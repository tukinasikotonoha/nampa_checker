Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tops#index'
  resources :results, param: :uuid, only: %i[index show new create destroy]
  get '/mypage', to: 'users#show' # マイページ
  get '/term', to: 'static_pages#term' # 利用規約
  get '/privacy', to: 'static_pages#privacy' # プライバシーポリシー
  delete '/logout', to: 'user_sessions#destroy' # ログアウト機能
  post 'oauth/callback', to: 'oauths#callback' # Twitterログイン
  get 'oauth/callback', to: 'oauths#callback' # for use with Github, Facebook
  get 'oauth/:provider', to: 'oauths#oauth', as: :auth_at_provider
  # 管理者ログイン、管理者画面、管理者画面ダッシュボード
  namespace :admin do
    root 'dashboards#index'
    get '/login', to: 'user_sessions#new'
    post '/login', to: 'user_sessions#create'
    delete '/logout', to: 'user_sessions#destroy'
    resources :users, only: %i[index destroy]
    resources :results, only: %i[index show destroy]
    resources :messages, only: %i[index edit update destroy]
  end
  # テスト環境でTwitterログイン認証を通すためのルーティング
  if Rails.env.test?
    get '/login_as/:user_id', to: 'test/sessions#login_as'
  end
end
