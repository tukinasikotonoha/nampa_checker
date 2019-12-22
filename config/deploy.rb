# capistranoのバージョン固定
lock "~> 3.10.1"

# デプロイするアプリケーション名
set :application, 'nampa_checker'

# cloneするgitのレポジトリ
# 1-3で設定したリモートリポジトリのurl
set :repo_url, 'git@github.com:yuikotonoha/nampa_checker.git'

# deployするブランチ。デフォルトはmasterなのでなくても可。
set :branch, 'develop'

# deploy先のディレクトリ。
set :deploy_to, '/var/www/nampa_checker'

# Default value for :pty is false
set :pty, true

# シンボリックリンクをはるファイル
# Default value for :linked_files is []
append :linked_files, "config/master.key"
# シンボリックリンクをはるフォルダ
# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system"

# 保持するバージョンの個数(※後述)
set :keep_releases, 5

# rubyのバージョン
# rbenvで設定したサーバー側のrubyのバージョン
set :rbenv_ruby, '2.6.4'

# 出力するログのレベル。
set :log_level, :debug

# デプロイのタスク
namespace :deploy do

  # unicornの再起動
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end

  # データベースの作成
  desc 'Create database'
  task :db_create do
    on roles(:db) do |host|
      with rails_env: fetch(:rails_env) do
        within current_path do
          # データベース作成のsqlセット
          # データベース名はdatabase.ymlに設定した名前で
          sql = "CREATE DATABASE IF NOT EXISTS nampa_checker_production;"
          # クエリの実行。
          # userとpasswordはmysqlの設定に合わせて
          execute "mysql --user=root --password=#{Rails.application.credentials.mysql_password} -e '#{sql}'"

        end
      end
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
    end
  end
end