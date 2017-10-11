Rails.application.routes.draw do
  devise_for :backoffice_administrators, skip: [:passwords, :registrations]
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'application#index'

  require 'sidekiq/web'
  require 'sidekiq-scheduler/web'
  mount Sidekiq::Web, at: 'sidekiq'
  mount PgHero::Engine, at: 'pghero'
end
