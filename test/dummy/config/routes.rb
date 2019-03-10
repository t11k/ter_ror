Rails.application.routes.draw do
  resources :terrorists, only: :create
end
