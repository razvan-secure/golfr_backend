Rails.application.routes.draw do
  devise_for :users, skip: :all

  namespace :api do
    post 'login', to: 'users#login'
    get 'feed', to: 'scores#user_feed'
    resources :users, only: %i[show] do
      get 'scores', to: 'scores#user_scores'
    end
    resources :scores, only: %i[create destroy index]
  end
end
