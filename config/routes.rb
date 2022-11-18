Rails.application.routes.draw do
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :admin do
    root to:"homes#top"
    resources :games, only: [:index,:new,:create,:show,:edit,:update]
    resources :users, only: [:index,:show,:edit]
    resources :reviews, only: [:show,:edit,:destroy]
  end
  namespace :public do
    resources :games,only: [:index,:show]
    get 'users/my_page' => 'users#show'
    get 'users/my_page/edit' => 'users#edit'
    patch 'users/my_page' => 'users#update'
    get 'users/unsubsscribe' => 'users#unsubsscribe'
    patch 'users/withdraw' => 'users#withdraw'
    resources :reviews,only: [:new]
    post 'reviews/confirm' => 'reviews#confirm'
    get 'reviews/complete' => 'reviews#complete'

  end
    root to:'public/homes#top'
end

