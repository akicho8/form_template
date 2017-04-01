Rails.application.routes.draw do
  get 'frontend/my_react001'
  get 'frontend/my_vue001'

  get 'about_page/privacy_policy'
  match 'privacy_policy' => 'about_page#privacy_policy', via: [:get]

  namespace :name_space1 do
    resources :type001_articles
    resources :type002_articles
    resources :type003_articles
    resources :type004_articles
    resources :type005_articles
    resources :type006_articles
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
  end

  get "tops/show"
  root "tops#show"
end
