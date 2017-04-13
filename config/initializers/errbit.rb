# Require the airbrake gem in your App.
# ---------------------------------------------
#
# Ruby - In your Gemfile
# gem 'airbrake', '~> 5.0'
#
# Then add the following to config/initializers/errbit.rb
# -------------------------------------------------------

Airbrake.configure do |config|
  config.host = 'http://tk2-221-20341.vs.sakura.ne.jp/errbit'
  config.project_id = 1 # required, but any positive integer works
  config.project_key = '0f40a916f718b31323cafd57ca489b58'

  # Uncomment for Rails apps
  # config.environment = Rails.env
  # config.ignore_environments = %w(development test)
end
