Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :applicants, only: %i[index show create new] do
    resources :credit_solicitations, only: %i[create new show]
  end
end
