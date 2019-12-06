Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tops#index'
  resources :results, param: :uuid, only: %i[index show new create destroy]
  # マイページ
  get '/mypage', to: 'users#show'
  # ログアウト機能
  delete '/logout', to: 'user_sessions#destroy'
  # Twitterログイン
  post 'oauth/callback', to: 'oauths#callback'
  get 'oauth/callback', to: 'oauths#callback' # for use with Github, Facebook
  get 'oauth/:provider', to: 'oauths#oauth', as: :auth_at_provider
end
