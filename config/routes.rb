Rails.application.routes.draw do
    devise_for :users, controllers: {
      sessions: 'api/sessions',
      omniauth_callbacks: 'api/omniauth_callbacks'
    }

    match '/users/:id/finish_signup' => 'api/users#finish_signup', via: [:get, :patch], :as => :finish_signup

    resources :stats, only: :index

    namespace :api do
        resources :players, only: :index
        resources :stat_lines, only: :index
        resources :users, only: [:index, :create]
        resources :dashboards, only: [:index, :show]
        resources :teams, only: [:index, :show]
        resources :games, only: [:index, :show]
        resources :charts, only: [:index, :show]
    end
end
