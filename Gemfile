source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.4'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 3.8'
  gem 'factory_bot_rails'
  gem 'pry-byebug'
  gem 'capybara'
  gem 'webdrivers'
  gem 'faker'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # rubocop
  gem 'rubocop', require: false
  gem 'rubocop-rails'
  # capistrano
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
end

group :production, :staging do
  # デプロイ用
  gem 'unicorn'
end

group :test do
  gem 'database_cleaner'
  gem 'fuubar'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'timecop'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# コードのチェック
gem 'rails_best_practices'
gem 'annotate', github: 'ctran/annotate_models', branch: 'develop'

# Debugger
gem 'better_errors'
gem 'pry'
gem 'pry-doc'
gem 'pry-rails'

# Bootstrap4の導入
gem 'bootstrap', '~> 4.3.1'
gem 'jquery-rails'
# font-awesomeの導入
gem 'font-awesome-sass', '~> 5.4.1'

# slimの導入
gem 'slim'
gem 'html2slim'
gem 'slim-rails'

# ログイン機能
gem 'sorcery'

# 日本語対応
gem 'rails-i18n'
gem 'enum_help'

# 顔認証API
gem 'aws-sdk', '~> 3'
gem 'aws-sdk-rekognition'

# テスト環境でSeedを作る
gem 'seed-fu'

# ページネーション
gem 'kaminari'

# 検索機能
gem 'ransack'

# OGP設定
gem 'meta-tags'

# 環境毎に定数を管理
gem 'config'

# アクセス解析
gem 'google-analytics-rails'
