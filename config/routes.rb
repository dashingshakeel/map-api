Rails.application.routes.draw do
  root to: 'welcome#index'
  get 'search/:query' => 'welcome#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
