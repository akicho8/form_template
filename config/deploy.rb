# config valid only for current version of Capistrano
lock "~> 3.10.1"

set :application, 'rails_playground'

set :repo_url, "file://#{Pathname(__dir__).dirname}"
# set :repo_url, "git@github.com:akicho8/rails_playground.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :branch, `git rev-parse --abbrev-ref HEAD`.strip
# set :branch, :master

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'
set :deploy_to, proc { "/var/www/#{fetch(:application)}_#{fetch(:stage)}" }

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')
# set :linked_files, fetch(:linked_files, []).push('config/secrets.yml', '.env')
# set :linked_files, fetch(:linked_files, []).push('config/database.yml')
append :linked_files, "config/master.key"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "storage"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :default_env, { path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH" }
set :default_env, -> { {"DISABLE_DATABASE_ENVIRONMENT_CHECK" => "1", "RAILS_ENV" => fetch(:rails_env)} }

# Default value for keep_releases is 5
set :keep_releases, 1

# for capistrano/rbenv

# set :rbenv_path, "/usr/local/var/rbenv"
# set :rbenv_type, :system # or :system, depends on your rbenv setup
# set :rbenv_ruby, File.read('.ruby-version').strip
# set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} /usr/local/bin/rbenv exec"

# set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
# set :rbenv_map_bins, %w{rake gem bundle ruby rails}
# set :rbenv_roles, :all # default value

# set :rbenv_path, "/usr/local/var/rbenv"
# set :rbenv_type, :system # or :system, depends on your rbenv setup
# set :rbenv_ruby, File.read('.ruby-version').strip
# set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} /usr/local/bin/rbenv exec"

set :rbenv_type, :system # or :system, depends on your rbenv setup
set :rbenv_ruby, File.read('.ruby-version').strip

################################################################################ bundler

# set :bundle_path, nil
# set :bundle_flags, '--deployment'
# ▼capistrano3.3.xでbin以下に配備されなくなる - Qiita
# https://qiita.com/yuuna/items/27a561a14399c5343d2f
set :bundle_binstubs, -> { shared_path.join('bin') }

################################################################################ yarn

# capistrano/yarn
# set :yarn_target_path, -> { release_path.join('subdir') } # default not set
# set :yarn_flags, '--production --silent --no-progress'    # default
# set :yarn_roles, :all                                     # default
# set :yarn_env_variables, {}                               # default

set :print_config_variables, true # デプロイ前に設定した変数値を確認

namespace :deploy do
  namespace :check do
    desc "環境変数の確認"
    task :env do
      on roles(:all) do
        execute :env
      end
    end
  end
  before "deploy:check", "deploy:check:env"
end

namespace :deploy do
  # desc 'Restart application'
  # task :restart do
  #   on roles(:app), in: :sequence, wait: 5 do
  #     execute :touch, release_path.join('tmp/restart.txt')
  #   end
  # end
  #
  # after :publishing, :restart

  # -  after "deploy:assets:precompile", :chmod_R do
  # -    on roles(:web), in: :groups, limit: 3, wait: 10 do
  # -      execute :chmod, "-R ug+w #{fetch(:deploy_to)}"
  # -    end
  # -  end

  # after :restart, :clear_cache do
  #   on roles(:web), in: :groups, limit: 3, wait: 10 do
  #     # Here we can do anything such as:
  #     # within release_path do
  #     #   execute :rake, 'cache:clear'
  #     # end
  #   end
  # end
  #

  if true
    task :app_clean do
      on roles :all do
        execute :rm, '-rf', deploy_to
        # execute :rake, "db:create"
      end
    end
    # before 'deploy:starting', 'deploy:app_clean'

    desc 'db_seed must be run only one time right after the first deploy'
    task :db_seed do
      on roles(:db) do |host|
        within release_path do
          # execute :pwd
          # execute :ls, "-al app/models"

          with rails_env: fetch(:rails_env) do
            execute :rake, 'db:seed'
          end
        end
      end
    end
    after 'deploy:migrate', 'deploy:db_seed'

    # desc 'Runs rake db:migrate if migrations are set'
    task db_reset: [:set_rails_env] do
      on primary fetch(:migration_role) do
        within release_path do
          with rails_env: fetch(:rails_env) do
            execute :rake, "db:drop", "DISABLE_DATABASE_ENVIRONMENT_CHECK=1"
            execute :rake, "db:create"
          end
        end
      end
    end
    # before 'deploy:migrate', 'deploy:db_reset'
  end

  # set :app_version, '1.2.3'
  # after :finished, 'airbrake:deploy'
end

namespace :deploy do
  # cap production deploy:upload_config_master_key
  desc "config/master.key のアップロード"
  task :upload_config_master_key do
    on roles :all do
      local_file = Pathname("config/master.key")
      server_file = shared_path.join(local_file)
      upload! local_file.open, server_file.to_s
    end
  end
  before "deploy:check:linked_files", "deploy:upload_config_master_key"

  # cap local deploy:upload_shared_config_database_yml
  desc "config/secrets.yml.key のアップロード"
  task :upload_shared_config_database_yml do
    on roles :all do
      local_file = "config/database.#{fetch(:stage)}.yml"
      if Pathname(local_file).exist?
        server_file = shared_path.join("config/database.yml")
        # unless test "[ -f #{server_file} ]"
        upload! File.open(local_file), server_file.to_s
        # end
      end
    end
  end
end

namespace :cable_puma do
  desc "ActionCable用のPuma: 再起動"
  task :restart do
    invoke "cable_puma:stop"
    invoke "cable_puma:start"
    invoke "cable_puma:status"
  end
  before "deploy:restart", "cable_puma:restart"

  desc "ActionCable用のPuma: 起動"
  task :start do
    on roles(:app) do |host|
      within current_path do
        with rails_env: fetch(:rails_env), "RAILS_RELATIVE_URL_ROOT" => "/rails-playground" do
          execute :pgrep, "-fl puma || true"
          execute :bundle, "exec", :pumactl, "-F cable/puma.rb start"
          execute :pgrep, "-fl puma || true"
        end
      end
    end
  end

  desc "ActionCable用のPuma: 停止"
  task :stop do
    on roles(:app) do |host|
      within current_path do
        with rails_env: fetch(:rails_env) do
          execute :pgrep, "-fl puma || true"
          execute :bundle, "exec", :pumactl, "-Q -F cable/puma.rb stop || true"
          execute :pgrep, "-fl puma || true"
        end
      end
    end
  end
  before "deploy:restart", "cable_puma:restart"

  desc "action_cable用のpuma: 状態を確認"
  task :status do
    on roles(:app) do |host|
      within current_path do
        with rails_env: fetch(:rails_env) do
          # pumactl status は 停止していても "Puma is started" しか表示しないため、まぎらわしいで実行しない
          # pgrep の方がまし。
          # execute :bundle, "exec", :pumactl, "-F cable/puma.rb status"
          execute :pgrep, "-fl puma || true"
        end
      end
    end
  end

  desc "action_cable用のpuma: プロセス強制除去"
  task :clean do
    on roles(:app) do |host|
      within current_path do
        with rails_env: fetch(:rails_env) do
          execute :pkill, "-f puma || true"
          execute :pgrep, "-fl puma || true"
        end
      end
    end
  end
end
