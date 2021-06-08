Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :users do
    resources :contacts, only: :index
    resources :contact_logs, only: :index
    resources :contact_files, only: [:index, :new, :create]
    get "import_contacts", to: "contacts#import_contacts"
    post 'import_contacts', to: 'contacts#create'
  end

  root to: 'users/contacts#index'
end
