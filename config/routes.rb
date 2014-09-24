Rails.application.routes.draw do
  

  resources :pets do
    resources :foods
  end

  root :to => redirect('/pets')
end
