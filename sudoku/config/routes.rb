Rails.application.routes.draw do
  resources :numbers
  get 'sudoku/home'
  get 'welcome/index'
  post 'numbers/validate'
  post 'sudoku/init'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
