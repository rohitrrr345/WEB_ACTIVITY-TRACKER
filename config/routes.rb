Rails.application.routes.draw do
  resources :users, only: [:create] do
    resources :activity_logs, only: [:create, :index]
  end
end
