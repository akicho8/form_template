environment ENV.fetch("RAILS_ENV") { "development" }
port ENV.fetch("PORT") { 28080 }
daemonize true
state_path 'tmp/pids/puma.state'
pidfile 'tmp/pids/puma.pid'
threads 0,16
workers 2
rackup "cable/config.ru"
