Rails.application.routes.draw do
root to: "hello#index"
  devise_for :users, controllers:{
    sessions:  'users/sessions',
  }
  get "/tweets/new" => "tweets#new"
  post "/tweets/new" => "tweets#index"
  get "/tweets/index" => "tweets#index"
  get "/tweets/mypage" => "tweets#mypage"
  post "likes/:post_id/create" => "likes#create"
  resources :tweets

end
