PrimroseRfid::Application.routes.draw do
  match 'rfidusers/search' => "rfidusers#search", :as => :search
  match 'user/edit' => 'users#edit', :as => :edit_current_user
  match 'logout' => 'sessions#destroy', :as => :logout
  match 'login' => 'sessions#new', :as => :login
  resources :sessions
  resources :logs
  match 'rfidusers/dumpdb' => "rfidusers#dumpdb", :as => :dumpdb
  resources :rfidusers
  resources :logs
  match 'rfidusers/:id/toggle' => "rfidusers#toggle", :as => :toggle
  root :to => "sessions#new"
  match '/*path' => redirect('/login')
end
