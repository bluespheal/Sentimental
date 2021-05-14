Rails.application.routes.draw do
  root to: redirect('/login')

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :results
  resources :users
  resources :textfiles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
