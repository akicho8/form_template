Rails.application.routes.draw do
  resources :code_articles

  # namespace :type028_foos do
  #   get 'type028_bars/index'
  # end

  get 'type028_foos/index'

  # mount ActionCable.server => '/cable'

  get 'type022_chat_rooms/show'

  get 'frontend/type024_article'
  get 'frontend/type025_article'
  get 'frontend/type026_article'
  get 'frontend/type027_article'
  get 'frontend/type030_article'
  get 'frontend/type031_article'
  get 'frontend/type032_article'
  get 'frontend/type033_article'
  get 'frontend/type034_article'

  get 'about_page/privacy_policy'
  match 'privacy_policy' => 'about_page#privacy_policy', via: [:get]

  namespace :name_space1 do
    resources :type001_articles
    resources :type002_articles
    resources :type003_articles
    resources :type004_articles
    resources :type005_articles
    resources :type006_articles
    resources :type096_articles
    resources :type007_articles
    resources :type008_articles
    resources :type009_articles
    resources :type010_articles
    resources :type011_articles
    resources :type012_articles
    resources :type013_articles
    resources :type014_articles
    resources :type015_articles
    resources :type016_articles
    resources :type016_articles
    resources :type017_articles
    resources :type018_email_activations
    resources :type018_users
    resources :type018_password_reset_url_notifications
    resources :type018_password_reseters
    resource :type018_session, except: [:edit, :update]
    resource :type018_home, only: [:show]
    resource :type019_home, only: [:show]
    resources :type020_users
    resource :type020_home, only: [:show]
    resource :type021_chat_room, only: [:show]
    resource :type022_chat_room, only: [:show]
    resource :type023_chat_room, only: [:show]
    resources :type029_articles do
      member do
        # get :ajax_params_inspector                                       # ← GETのみの場合
        # match 'ajax_params_inspector', via: [:get, :post, :put, :delete] # ← いろんなのに対応
        match 'ajax_params_inspector', via: :all                           # ← 全部に対応
      end
    end
  end

  # for DHH流のルーティング
  # link_to("上", [:type028_foos])
  # link_to("下", [:type028_foo, :type028_bars, type028_foo_id: 1])
  resources :type028_foos, only: [:index] do
    resources :type028_bars, only: [:index], :module => 'type028_foos' # インデントが狂うため古いハッシュ形式にしている
  end

  # require "action_controller/railtie"
  # ActionPack::VERSION::STRING     # => "5.1.3"
  #
  # Class.new(Rails::Application).routes.draw do
  direct :google do |value|
    "https://www.google.co.jp/?q=#{value}"
  end
  # end
  #
  # include Rails.application.routes.url_helpers
  #
  # url_for(:google)           # => "https://www.google.co.jp/?q="
  # url_for([:google, q: "1"]) # => "https://www.google.co.jp/?q=1"
  # google_url                 # => "https://www.google.co.jp/?q="
  # google_url(q: "1")         # => "https://www.google.co.jp/?q=1"
  # google_path                # => "/?q="
  # google_path(q: "1")        # => "/?q=1"
  #
  # def google_search_url(q)
  #   "https://www.google.co.jp/?q=#{q}"
  # end

  get "tops/show"
  root "tops#show"
end
