Rails.application.routes.draw do
  # get 'messages/index'
  #
  # get 'messages/new'
  #
  # get 'messages/create'
  #
  # get 'messages/show'
  #
  # get 'messages/edit'
  #
  # get 'messages/update'
  #
  # get 'messages/delete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get "/" => "'events#show'",as: :home

  get "messages/done"=>"messages#done", as: :done

  get "/"=>"messages#new"

  post "/search"=>"messages#search"

  resources :messages

end
