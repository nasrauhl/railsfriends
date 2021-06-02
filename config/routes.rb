Rails.application.routes.draw do
  get 'favorites/update'
  devise_for :users
  resources :entries do
  	member do 
  		get "like", to: "entries#upvote"
  		get "dislike", to: "entries#downvote"
  	end
  end

  resources :friends
  resources :preferences
 
get 'home/about'
root 'home#about'
get '/search' => 'entries#search', :as => 'search_entry'
get "/list" => "entries#list", :as => 'list_entry'

end
