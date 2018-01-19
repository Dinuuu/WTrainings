Rails.application.routes.draw do
  devise_for :backoffice_administrators, skip: [:passwords, :registrations]
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'application#index'

  namespace :api do
    namespace :v1 do
      resources :charts, only: :none do
        collection do
          get :trainings_per_month
          get :trainings_per_type
          get :summary_info
          get :trainings_attendance
        end
      end
    end
  end

  require 'sidekiq/web'
  require 'sidekiq-scheduler/web'
  mount Sidekiq::Web, at: 'sidekiq'
  mount PgHero::Engine, at: 'pghero'
end
