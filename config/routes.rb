Rails.application.routes.draw do
  root 'welcome#index'

  # resources :books

  get 'sessions/new' => 'sessions#new', as: :login
  post 'sessions/new' => 'sessions#create'
  delete 'sessions' => 'sessions#delete', as: :logout

  get 'register' => 'users#new', as: :registration
  post 'register' => 'users#create'

  get 'users/:username' => 'users#show', as: :user

  get 'books' => 'books#index', as: :books
  get 'books/new' => 'books#new', as: :new_book
  post 'books' => 'books#create'
  get 'books/:id' => 'books#show', as: :book
  get 'books/:id/edit' => 'books#edit', as: :edit_book
  patch 'books/:id' => 'books#update'
  delete 'books/:id' => 'books#destroy'

end
