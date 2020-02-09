require_relative 'boot'

require 'rails/all'
require 'aws-sdk-rekognition'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NampaChecker
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Don't generate system test files.
    config.generators.system_tests = nil

    # デフォルトのテンプレートエンジンをslimに変更
    config.generators.template_engine = :slim

    # Timezoneを修正
    # DBへの保存はJSTで画面表示もJST(日本時間)
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    # rails g コマンドを使用した際に、assets、helper、testファイル、ルーティングが生成されないように設定
    config.generators do |g|
      g.helper false          # ヘルパー生成せず
      g.assets false          # CSS/JSファイル生成せず
      g.skip_routes true      # routes.rb変更せず
      g.test_framework :rspec # modelやcontrollerを作るタイイングでテストファイルを作成
    end
    # 日本語化
    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]

  end
end
